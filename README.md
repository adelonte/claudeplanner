# Claude Planner

Persistent file-based planning for complex tasks. Uses markdown files as working memory to prevent goal drift, track decisions, and log errors across long sessions.

## The Problem

AI agents suffer from:

- **Volatile memory** — Context resets lose information
- **Goal drift** — After 50+ tool calls, original goals get forgotten
- **Hidden errors** — Failures aren't tracked, so mistakes repeat

## The Solution: 2-File Pattern

```
task_plan.md    → Goal, phases, decisions
progress.md     → Session log, findings, errors
```

### Core Principle

```
Context Window = RAM (volatile, limited)
Filesystem = Disk (persistent, unlimited)

→ Anything important gets written to disk.
```

## Quick Start

1. **Create `task_plan.md`** — Define goal and phases
2. **Create `progress.md`** — Log progress and findings
3. **Re-read plan before major decisions**
4. **Update status after each phase**

## Key Rules

1. **Create Plan First** — Never start without `task_plan.md`
2. **The 2-Action Rule** — Save findings after every 2 search/browser operations
3. **Log ALL Errors** — They help avoid repetition
4. **Never Repeat Failures** — Track attempts, mutate approach

## File Structure

```
claude-planner/
├── planning-with-files/
│   ├── SKILL.md
│   ├── templates/
│   │   ├── task_plan.md
│   │   └── progress.md
│   └── scripts/
│       ├── init-session.sh
│       ├── init-session.ps1
│       ├── check-complete.sh
│       ├── check-complete.ps1
│       └── session-catchup.py
└── .claude-plugin/
    ├── plugin.json
    └── marketplace.json
```

## When to Use

**Use for:**
- Multi-step tasks (3+ steps)
- Research tasks
- Building projects
- Tasks spanning many tool calls

**Skip for:**
- Simple questions
- Single-file edits
- Quick lookups

## License

MIT License

---

**Author:** sina v
