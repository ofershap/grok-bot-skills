# Grok Bot Skills: reusable skills for AI assistants

Open-source Agent Skills for Grok bot workflows and skill-compatible AI assistants. Get shorter answers, Slack drafts in your own voice, clearer explanations, and a monthly check on whether a new habit is useful.

Five focused skills, plain Markdown, MIT licensed. Read the [catalog](#catalog), install one skill, or [contribute your own](CONTRIBUTING.md).

## What is a Grok bot skill?

A skill is a folder with a `SKILL.md` file: a description of when to use it, followed by instructions for the assistant. This collection uses the [Agent Skills format](https://agentskills.io/specification). It is a community library, not an official xAI product.

These are instructions, not a Grok API client, model, browser extension, or hosted bot. Your assistant must have a way to load them. Loading a file does not grant account access or permission to send messages.

## Use with Grok or another assistant

- **Skill-compatible agent:** use the installer below, then check that your agent discovers the skill and activates it for a matching request.
- **Grok bot with a custom skill loader:** add the selected `SKILL.md` through that bot's documented loader. The loader controls installation and activation; this repo does not provide one.
- **Chat-only interface:** paste the instructions as context if your interface supports it. This is manual use, not automatic skill discovery or a guaranteed persistent installation.

Grok bot loaders have not been tested here. A successful CLI install alone does not prove that a particular Grok interface loads skills.

## Install

### In Grok Bot

If your Grok Bot has a skill library and can read repository files, paste this prompt into its chat:

```text
Install the agent skills from https://github.com/ofershap/grok-bot-skills into my skill library. Read each skills/<name>/SKILL.md, save each one under its folder name with its description as-is, then list what you installed.
```

### In Cursor

[![Open in Cursor](https://img.shields.io/badge/Open_in-Cursor-000000?logo=cursor&logoColor=white)](https://cursor.com/link/prompt?text=Install%20the%20agent%20skills%20from%20https%3A%2F%2Fgithub.com%2Fofershap%2Fgrok-bot-skills%3A%20read%20each%20skills%2F%3Cname%3E%2FSKILL.md%20and%20add%20them%20to%20my%20skill%20library%2C%20keeping%20each%20skill%27s%20name%20and%20description%20as-is.%20Then%20list%20what%20you%20installed.)

### With the skills CLI

All skills:

```bash
npx skills add ofershap/grok-bot-skills --all
```

One skill:

```bash
npx skills add ofershap/grok-bot-skills --skill make-it-click
```

Manual fallback:

```bash
git clone --depth 1 https://github.com/ofershap/grok-bot-skills.git
mkdir -p .agents/skills
cp -R grok-bot-skills/skills/<name> .agents/skills/
```

## Catalog

| Skill | What it does | Use it when |
| --- | --- | --- |
| [short-answers](skills/short-answers) | BLUF replies in plain, ASD-STE100-style English with a direct "dugri" tone. | Every reply to the owner should be readable in seconds. |
| [slack-voice](skills/slack-voice) | Drafts Slack messages in the owner's own register, one language at a time, and learns from their rewrites. | The agent drafts or sends Slack messages on someone's behalf. |
| [distill-need](skills/distill-need) | Separates the literal ask from the real need and offers 1-3 ways to hit it, including "don't build". | A request looks like a proposed solution, or someone is stuck understanding a PR, design, or thread. |
| [make-it-click](skills/make-it-click) | Finds the smallest thing blocking understanding and replaces the failed mental model with a concrete one. | An explanation was correct but did not land. |
| [monthly-checkpoint](skills/monthly-checkpoint) | Reviews a month of a new habit or data source and sends a short keep/change/stop summary. | About 30 days after turning on something new, like meeting recordings or a digest. |

## Try a skill

| Skill | Test prompt | What to look for |
| --- | --- | --- |
| short-answers | "Summarize this decision in two sentences." | Answer first, no padded introduction. |
| slack-voice | "Draft a Slack update based on these messages." | Matches supplied examples and waits before sending. |
| distill-need | "I think we need a dashboard. Help me decide." | Identifies the actual need before proposing a build. |
| make-it-click | "I still do not understand this explanation." | Uses a concrete example instead of repeating the same explanation. |
| monthly-checkpoint | "Review whether this month's new habit helped." | Uses available evidence and names missing data. |

Use synthetic examples. Do not paste private messages, credentials, or customer data into a public issue.

## Share a useful Grok bot skill

Have a skill that helps your Grok bot or another assistant? [Open a pull request](https://github.com/ofershap/grok-bot-skills/pulls) with the skill, a trigger, and a before/after example. You can also [suggest a skill in an issue](https://github.com/ofershap/grok-bot-skills/issues/new).

Read [CONTRIBUTING.md](CONTRIBUTING.md) for the format, test checklist, attribution, and safety checks. New contributions are reviewed before merging. Useful, tested skills matter more than the number of files.

## FAQ

### Is this an official Grok or xAI repository?

No. This is a community collection maintained independently of xAI.

### Does it work only with Grok?

No. The files follow the Agent Skills format and can be used by compatible loaders. Features such as Slack history or scheduled reviews require your assistant's own integrations and permissions.

### Does installing a skill run code or send messages?

The five current skills are Markdown instructions. They do not include an executable runtime. An assistant may act on instructions using its own tools, so read each file and keep your normal approval rules.

### How do agents find the right skill?

Each file includes a `name` and trigger-oriented `description`. The catalog and [llms.txt](llms.txt) provide an index. Discovery and activation depend on the assistant; an index is not a guarantee of ranking or adoption.

## Credits

`distill-need` and `make-it-click` are adapted from [AdirD/agent-shell-hamelech](https://github.com/AdirD/agent-shell-hamelech) under the MIT License:

- [melech-distill-need](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-distill-need)
- [melech-make-it-click](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-make-it-click)

Each adapted file keeps the original copyright and license notice at the top.

## License

MIT. See [LICENSE](LICENSE).
