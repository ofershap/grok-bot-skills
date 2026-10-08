# Contribute a Grok bot skill

Share a small skill that solved a real problem. Grok bot users and users of other skill-compatible assistants are welcome.

## Submit

1. Fork this repository and create a branch.
2. Add `skills/<slug>/SKILL.md`. Use a lowercase kebab-case slug.
3. Include frontmatter with `name` matching the folder and a `description` explaining when the skill should activate.
4. Add clear steps, limits, and one synthetic input/output example. Put extra material in `references/` if needed.
5. Add the skill to the README catalog and `llms.txt`.
6. Test a matching prompt and a prompt that should not activate it. State the bot or loader used and any permissions required.
7. Open a pull request using the checklist. If you only have an idea, open an issue instead.

```markdown
---
name: example-skill
description: Use when the user needs a specific task or outcome.
---
# Example skill

## Steps
1. Check the input and permissions.
2. Do the task.
3. Report the result and any limits.

## Example
Input: a synthetic request
Expected: the intended response or behavior
```

## Review checklist

- One clear use case, without duplicate or unrelated skills.
- No secrets, private messages, personal data, internal URLs, or employer-specific content.
- No instructions to hide actions, bypass approval, extract secrets, or override safety rules.
- External actions and private integrations require the user's permission.
- No remote scripts, new dependencies, or executable assets without explaining their purpose and risks.
- Preserve upstream copyright and license notices; name the source of adapted work.
- Say what you tested. Do not claim Grok compatibility based only on a file being copied.

Keep contributions in English for a shared catalog. Skills may explain how to respond in other languages.

Contributions are offered under this repository's MIT License. You must have the right to share the content. Maintainers review submissions before merging; opening an issue or PR does not publish a skill into the catalog automatically.
