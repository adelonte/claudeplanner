#!/bin/bash
# Initialize planning files for a new session
# Usage: ./init-session.sh [project-name]

set -e

PROJECT_NAME="${1:-project}"
DATE=$(date +%Y-%m-%d)

echo "Initializing planning files for: $PROJECT_NAME"

# Create task_plan.md if it doesn't exist
if [ ! -f "task_plan.md" ]; then
    cat > task_plan.md << 'EOF'
# Task: [Brief Description]

## Goal

[One sentence describing the end state]

## Current Phase

Phase 1

## Phases

### Phase 1: [Title]

- [ ] [Subtask]
- [ ] [Subtask]
- **Status:** in_progress

### Phase 2: [Title]

- [ ] [Subtask]
- [ ] [Subtask]
- **Status:** pending

### Phase 3: [Title]

- [ ] [Subtask]
- [ ] [Subtask]
- **Status:** pending

## Key Questions

1. [Question to answer]
2. [Question to answer]

## Decisions

| Decision | Rationale |
| -------- | --------- |
|          |           |

## Notes

- Update phase status as you progress: pending → in_progress → complete
- Re-read this plan before major decisions
EOF
    echo "Created task_plan.md"
else
    echo "task_plan.md already exists, skipping"
fi

# Create progress.md if it doesn't exist
if [ ! -f "progress.md" ]; then
    cat > progress.md << EOF
# Progress Log

## Session: $DATE

### Completed

- [Action taken]

### Findings & Research

- [Finding]

### Files Changed

- [filename] (created/modified)

## Errors

| Error | Attempt | Resolution |
| ----- | ------- | ---------- |
|       | 1       |            |

## Resources

- [Resource]
EOF
    echo "Created progress.md"
else
    echo "progress.md already exists, skipping"
fi

echo ""
echo "Planning files initialized!"
echo "Files: task_plan.md, progress.md"
