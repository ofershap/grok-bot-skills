# grok-bot-skills

Small, sharp skills that make a chat assistant or coding agent easier to work with. Shorter answers, messages that sound like you, real needs instead of literal asks, explanations that finally land, and an honest monthly check on whether a new habit pays off.

Each skill is a plain `SKILL.md` in the [Agent Skills](https://agentskills.io) format, so it works with any agent that loads skills: drop it in, and the agent picks it up when the description matches.

## Install

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

## Credits

`distill-need` and `make-it-click` are adapted from [AdirD/agent-shell-hamelech](https://github.com/AdirD/agent-shell-hamelech) under the MIT License:

- [melech-distill-need](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-distill-need)
- [melech-make-it-click](https://github.com/AdirD/agent-shell-hamelech/tree/main/skills/melech-make-it-click)

Each adapted file keeps the original copyright and license notice at the top.

## License

MIT. See [LICENSE](LICENSE).
