# AGENTS.md

Rules for agents working in this repo.

- Each skill lives at `skills/<slug>/SKILL.md`. The frontmatter `name` must equal the folder slug, in kebab-case. Extra material for a skill goes in `skills/<slug>/references/`.
- Frontmatter has `name` and `description` only. The description is one clear sentence on when to use the skill.
- When you add, remove, or rename anything under `skills/`, update the catalog table in `README.md` in the same commit.
- Skills stay generic. No personal, company, or internal references: no real names, internal links, ticket keys, or company-specific tools.
- Keep the attribution notice at the top of any skill adapted from another repo, and keep its README credit.
- Commit email is `ofershap@users.noreply.github.com` only.
- Run `scripts/pre-push-audit.sh` before every push. Do not push if it fails.
