# S-Bros Skills Hub

Public library of operational runbooks, automation scripts, and workflow skills for AI coding assistants (Google Antigravity, Saya, Claude Code, Cursor).

---

## Available Skills

| Skill | Description | Category |
| :--- | :--- | :--- |
| [`s-bros-bot`](./skills/s-bros-bot/SKILL.md) | Setup, configuration, pre-flight verification, and PM2 deployment of Telegram QA Issue Bots for any Git repository. | DevOps & QA |

---

## Installation

### Method 1: Install All Skills Globally (Recommended)
Clone this repository directly into your machine's global Antigravity skills directory. Every skill in the hub will be automatically discovered across all your projects:

```bash
git clone https://github.com/Brosfeer/s-bros-skills.git ~/.gemini/antigravity-cli/skills/s-bros-skills
```

### Method 2: Install into a Specific Project (Workspace Scope)
To install only a specific skill into the active repository:

```bash
# Example: Installing s-bros-bot into your current project
mkdir -p .agents/skills/s-bros-bot
curl -sSL https://raw.githubusercontent.com/Brosfeer/s-bros-skills/main/install.sh | bash -s s-bros-bot
```

Or using Git clone:
```bash
git clone --depth 1 https://github.com/Brosfeer/s-bros-skills.git /tmp/s-bros-skills
cp -r /tmp/s-bros-skills/skills/s-bros-bot .agents/skills/
rm -rf /tmp/s-bros-skills
```

---

## How AI Assistants Discover These Skills

Antigravity and Saya use Progressive Disclosure. When a skill is present in `.agents/skills/` or `~/.gemini/antigravity-cli/skills/`, the assistant:
1. Reads only the `name` and `description` from `SKILL.md`.
2. Automatically activates the full procedure and automation scripts when your chat prompt matches the skill's purpose.

---

## Contributing New Skills

To add a new skill to this hub:
1. Create a folder under `skills/<skill-name>/`.
2. Include a valid `SKILL.md` with YAML frontmatter (`name`, `description`).
3. Add helper tools in `scripts/` and documentation in `references/`.
4. Open a pull request.

---

## Author & License

Maintained by Sharaf (@Brosfeer) as part of the Saya Developer Ecosystem. Distributed under the MIT License.
