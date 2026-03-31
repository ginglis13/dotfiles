# AI Skills

This directory maintains reusable skill definitions for AI coding assistants.

## Overview

Each skill is a markdown file that defines:
- **Purpose**: What the skill does
- **Checks/Requirements**: Mandatory validations before proceeding
- **Process**: Step-by-step workflow
- **Output Format**: Standardized response structure

Skills are designed to be **platform-agnostic** (I use Qwen and Claude code).

## Installation

Use the install script to copy skills to your preferred AI assistant's directory:

```bash
./install.sh <qwen|claude> [--local|--global]
```

### Examples

```bash
# Install for Qwen Code globally (~/.qwen/skills)
./install.sh qwen --global

# Install for Claude locally (./.claude/skills)
./install.sh claude --local

# Install for Claude globally (~/.claude/skills)
./install.sh claude --global
```

### Installation Locations

| Target | Scope | Location |
|--------|-------|----------|
| `qwen --local` | Current project | `./.qwen/skills/` |
| `qwen --global` | All projects | `~/.qwen/skills/` |
| `claude --local` | Current project | `./.claude/skills/` |
| `claude --global` | All projects | `~/.claude/skills/` |

---

## Available Skills

| Skill | Description |
|-------|-------------|
| `pr-review-rust.md` | Review Rust PRs from GitHub with strict quality checks |

---

## Using Skills with Claude

### Method 1: Direct Paste (Simple)
1. Open the skill file (e.g., `pr-review-rust.md`)
2. Copy its contents
3. Paste into Claude chat with your request:

```
I want you to act as a Rust PR reviewer. Here are my requirements:

[Paste skill contents here]

---

Please review this PR: [PR URL or diff]
```

### Method 2: Claude Projects (Recommended)
If you have Claude Pro with Projects:
1. Create a new Project called "AI Skills"
2. Add the `ai-skills/` directory to the project
3. Reference skills by name:

```
Using the pr-review-rust skill, review this PR: [URL]
```

### Method 3: Claude Desktop App
If using Claude Desktop with local file access:
1. Enable local file access in settings
2. Reference the skill file directly:

```
@ai-skills/pr-review-rust.md Review this PR: [URL]
```

---

## Using Skills with Qwen Code

Qwen Code has built-in support for skills in this directory.

### Method 1: Invoke via Skill Command
```
skill: "pr-review-rust"
```

This loads the skill context automatically.

### Method 2: Reference in Prompt
```
Using the pr-review-rust skill from ./ai-skills, review this GitHub PR: [URL]
```

---

## Creating New Skills

To add a new skill:

1. Create a new `.md` file in `ai-skills/`
2. Follow the structure:
   - `## Purpose`
   - `## Initial Checks` (if applicable)
   - `## Process`
   - `## Output Format`
3. Keep it platform-agnostic (no tool-specific commands)
4. Add to the "Available Skills" table above

### Skill Template

```markdown
# Skill Name

## Purpose
[What this skill does]

## Initial Checks
- [Required validations]

## Process
1. [Step 1]
2. [Step 2]

## Output Format
[Expected response structure]
```
