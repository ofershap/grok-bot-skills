<p align="center">
  <img src="assets/logo.svg" alt="Grok Bot Skills" width="100" height="100" />
</p>

<h1 align="center">grok-bot-skills</h1>

<p align="center">
  <strong>Teach your Grok bot a new trick with one Markdown file.</strong>
</p>

<p align="center">
  A community library of ready-to-install Agent Skills for Grok bots<br>
  and any skill-compatible AI assistant.
</p>

<p align="center">
  <a href="https://agentskills.io/specification"><img src="https://img.shields.io/badge/Agent_Skills-format-0ea5e9.svg" alt="Agent Skills format" /></a>
  &nbsp;
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License: MIT" /></a>
  &nbsp;
  <a href="CONTRIBUTING.md"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg" alt="PRs welcome" /></a>
</p>

---

Skills are folders of instructions that an AI assistant loads when a matching task comes up. Each skill in this library is one `SKILL.md`: a name, a trigger description, and the instructions. No runtime, no dependencies, nothing to deploy.

This library is for Grok bot workflows, maintained independently of xAI. The files follow the open [Agent Skills format](https://agentskills.io/specification), so any skill-compatible assistant can load them. Grok bot skill loaders have not been tested here: a successful CLI install alone does not prove that a particular Grok interface loads skills.

## Catalog

| Skill | What it does | Use it when |
| --- | --- | --- |
| [short-answers](skills/short-answers) | BLUF replies in plain, ASD-STE100-style English with a direct "dugri" tone. | Every reply to the owner should be readable in seconds. |
| [slack-voice](skills/slack-voice) | Drafts Slack messages in the owner's own register, one language at a time, and learns from their rewrites. | The agent drafts or sends Slack messages on someone's behalf. |
| [distill-need](skills/distill-need) | Separates the literal ask from the real need and offers 1-3 ways to hit it, including "don't build". | A request looks like a proposed solution, or someone is stuck understanding a PR, design, or thread. |
| [make-it-click](skills/make-it-click) | Finds the smallest thing blocking understanding and replaces the failed mental model with a concrete one. | An explanation was correct but did not land. |
| [monthly-checkpoint](skills/monthly-checkpoint) | Reviews a month of a new habit or data source and sends a short keep/change/stop summary. | About 30 days after turning on something new, like meeting recordings or a digest. |
| [claim-check](skills/claim-check) | Check a claim against dated evidence, not repetition. | The user wants to check a factual claim, viral post, or disputed announcement rather than summarize it. |
| [assumption-audit](skills/assumption-audit) | Test the question before answering it. | A question contains an unproven cause, loaded premise, or undefined claim such as best, safe, or guaranteed. |
| [consensus-map](skills/consensus-map) | Show the shape of disagreement without manufacturing consensus. | The user asks what credible sources agree or disagree about on a contested question. |
| [source-audit](skills/source-audit) | Read laterally and follow a claim back to its evidence. | The user has an article, chart, or citation and needs to know whether it supports a specific claim. |
| [competitor-compare](skills/competitor-compare) | Compare eligibility first, then comparable costs. | Comparing a short list of products or vendors against explicit buying or positioning criteria. |
| [morning-brief](skills/morning-brief) | Keep commitments, deadlines, and missing data separate. | The user provides today's calendar and task notes and wants a source-traceable plan with conflicts and gaps. |
| [research-review](skills/research-review) | Review original evidence, not another assistant's confidence. | A research memo or numerical recommendation needs a separate evidence-checking pass before reliance or sharing. |
| [socratic-practice](skills/socratic-practice) | Make the learner do the next useful piece of work. | The user wants active practice learning a concept, with hints and a check of understanding rather than an instant solution. |
| [reflection-to-action](skills/reflection-to-action) | Turn a specific experience into a small experiment. | The user wants to learn from a recent team experience or personal work setback and choose a concrete improvement. |
| [rubric-rewrite](skills/rubric-rewrite) | Define good before revising. | A draft feels generic or weak and the user wants a revision guided by explicit quality criteria and examples. |
| [quote-grounded-answer](skills/quote-grounded-answer) | Extract the evidence before synthesizing the answer. | Answering a specific question from a long document or several supplied documents and exact textual support matters. |
| [root-cause-debug](skills/root-cause-debug) | Reproduce, isolate, test, then verify. | Investigating a reproducible software bug, failing test, or surprising behavior before applying a fix. |
| [code-walkthrough](skills/code-walkthrough) | Follow a real flow through real source. | The user wants to understand an unfamiliar codebase or generated code through a traceable execution path. |

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

These are instructions, not a Grok API client, model, browser extension, or hosted bot. Your assistant must have a way to load them. On a chat-only interface, paste a skill's instructions as context: that is manual use, not automatic skill discovery.

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

All 18 current skills are Markdown instructions. They do not include an executable runtime. An assistant may act on instructions using its own tools, so read each file and keep your normal approval rules.

### How do agents find the right skill?

Each file includes a `name` and trigger-oriented `description`. The catalog and [llms.txt](llms.txt) provide an index. Discovery and activation depend on the assistant; an index is not a guarantee of ranking or adoption.

## Credits

Source credit is included in each skill and in [SOURCES.md](SOURCES.md). Source authors have not endorsed or tested these adaptations.

`distill-need` and `make-it-click` are adapted from [AdirD/agent-shell-hamelech](https://github.com/AdirD/agent-shell-hamelech) under the MIT License:

- [melech-distill-need](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-distill-need)
- [melech-make-it-click](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-make-it-click)

Each adapted file keeps the original copyright and license notice at the top.

## Author

[![Made by ofershap](https://gitshow.dev/api/card/ofershap)](https://gitshow.dev/ofershap)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://linkedin.com/in/ofershap)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=flat&logo=github&logoColor=white)](https://github.com/ofershap)

---

<sub>README built with [README Builder](https://ofershap.github.io/readme-builder/)</sub>

## License

[MIT](LICENSE) &copy; [Ofer Shapira](https://github.com/ofershap)
