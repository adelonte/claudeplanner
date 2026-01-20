---
name: claude-planner
version: "1.0.0"
description: Persistent file-based planning for complex tasks. Uses task_plan.md and progress.md as working memory to prevent goal drift and track progress.
user-invocable: true
allowed-tools:
  - Read
  - Write
  - Edit
  - Bash
  - Glob
  - Grep
  - WebFetch
  - WebSearch
hooks:
  PreToolUse:
    - matcher: "Write|Edit|Bash"
      hooks:
        - type: command
          command: "cat task_plan.md 2>/dev/null | head -20 || true"
  Stop:
    - hooks:
        - type: command
          command: "grep -c '\\- \\[ \\]' task_plan.md 2>/dev/null && echo '[planning] Incomplete tasks remain' || echo '[planning] All tasks complete'"
---

# Planning with Files

Use persistent markdown files as working memory.

## The 2-File Pattern

| File           | Purpose                       | When to Update     |
| -------------- | ----------------------------- | ------------------ |
| `task_plan.md` | Goal, phases, decisions       | After each phase   |
| `progress.md`  | Session log, findings, errors | Throughout session |

## Quick Start

1. **Create `task_plan.md`** — Define goal and phases
2. **Create `progress.md`** — Log progress and findings
3. **Re-read plan before major decisions**
4. **Update status after each phase**

## Core Rules

### 1. Create Plan First

Never start a complex task without `task_plan.md`.

### 2. The 2-Action Rule

After every 2 search/browser operations, save findings to `progress.md`.

### 3. Log ALL Errors

Every error goes in `progress.md`. This prevents repetition.

### 4. Never Repeat Failures

```
if action_failed:
    next_action != same_action
```

## Error Protocol

```
ATTEMPT 1: Diagnose & fix
ATTEMPT 2: Try different approach
ATTEMPT 3: Question assumptions
AFTER 3 FAILURES: Ask user for guidance
```

## When to Use

**Use for:** Multi-step tasks, research, building projects

**Skip for:** Simple questions, single-file edits

## Templates

- [templates/task_plan.md](templates/task_plan.md)
- [templates/progress.md](templates/progress.md)
