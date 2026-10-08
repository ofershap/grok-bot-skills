#!/usr/bin/env bash
set -euo pipefail

ALLOWED_EMAIL="ofershap@users.noreply.github.com"
SELF="scripts/pre-push-audit.sh"
DENYLIST='elementor|sticklight|ofers@|oferlmntr|wisprflow|notes\.wisprflow|slack\.com/archives|atlassian\.net'

cd "$(git rev-parse --show-toplevel)"
fail=0

if git rev-parse --verify --quiet HEAD >/dev/null; then
  bad_emails=$(git log --all --format='%H %ae %ce' | awk -v ok="$ALLOWED_EMAIL" '$2 != ok || $3 != ok')
  if [[ -n "$bad_emails" ]]; then
    echo "FAIL: commits with an author or committer email other than $ALLOWED_EMAIL:"
    echo "$bad_emails"
    fail=1
  fi
fi

files=()
while IFS= read -r -d '' f; do
  [[ "$f" == "$SELF" ]] && continue
  [[ -f "$f" ]] && files+=("$f")
done < <(git ls-files -z)

if ((${#files[@]})); then
  if hits=$(grep -n -i -E "$DENYLIST" -- "${files[@]}"); then
    echo "FAIL: denylisted terms found:"
    echo "$hits"
    fail=1
  fi

  if echo x | LC_ALL=C.UTF-8 grep -qP 'x' 2>/dev/null; then
    if hits=$(LC_ALL=C.UTF-8 grep -n -P '[\x{0590}-\x{05FF}]' -- "${files[@]}"); then
      echo "FAIL: Hebrew characters found:"
      echo "$hits"
      fail=1
    fi
  else
    if ! python3 - "${files[@]}" <<'PY'
import re, sys
pattern = re.compile("[\u0590-\u05FF]")
found = False
for path in sys.argv[1:]:
    with open(path, encoding="utf-8", errors="replace") as fh:
        for n, line in enumerate(fh, 1):
            if pattern.search(line):
                if not found:
                    print("FAIL: Hebrew characters found:")
                found = True
                print(f"{path}:{n}:{line.rstrip()}")
sys.exit(1 if found else 0)
PY
    then
      fail=1
    fi
  fi
fi

if ((fail)); then
  echo "Audit failed. Fix the lines above before pushing."
  exit 1
fi

echo "OK: commit emails and tracked file contents passed the audit."
