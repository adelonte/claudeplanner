# Initialize planning files for a new session
# Usage: .\init-session.ps1 [project-name]

param(
    [string]$ProjectName = "project"
)

$DATE = Get-Date -Format "yyyy-MM-dd"

Write-Host "Initializing planning files for: $ProjectName"

# Create task_plan.md if it doesn't exist
if (-not (Test-Path "task_plan.md")) {
    @"
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

- Update phase status as you progress: pending -> in_progress -> complete
- Re-read this plan before major decisions
"@ | Out-File -FilePath "task_plan.md" -Encoding UTF8
    Write-Host "Created task_plan.md"
} else {
    Write-Host "task_plan.md already exists, skipping"
}

# Create progress.md if it doesn't exist
if (-not (Test-Path "progress.md")) {
    @"
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
"@ | Out-File -FilePath "progress.md" -Encoding UTF8
    Write-Host "Created progress.md"
} else {
    Write-Host "progress.md already exists, skipping"
}

Write-Host ""
Write-Host "Planning files initialized!"
Write-Host "Files: task_plan.md, progress.md"
