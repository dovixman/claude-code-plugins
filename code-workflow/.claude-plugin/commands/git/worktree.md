---
argument-hint: [--feat][--fix][--hotfix] [--base-branch <branch>] [branch_name]
description: "Create an use a new worktree"
allowed-tools: Bash(git worktree:*), Bash(git branch:*), Bash(git status:*)
---

# Context:
- Current branch: !`git branch --show-current`
- Existing worktrees: !`git worktree list`
- User arguments: $ARGUMENTS

# Task:

## 1. Get branch name
- If the user did not provide a branch name/description in $ARGUMENTS (excluding flags like --feat, --fix, --hotfix, --base-branch), use the AskUserQuestion tool to ask for a brief description of the feature/fix to be implemented.

## 2. Determine task type
Priority order:
1. **Check for explicit flags in $ARGUMENTS:**
   - `--feat` → use `feat/` prefix
   - `--fix` → use `fix/` prefix
   - `--hotfix` → use `hotfix/` prefix
2. **Auto-detect from description keywords:**
   - Keywords like "fix", "bug", "issue", "error", "repair" → `fix/`
   - Keywords like "hotfix", "urgent", "critical", "emergency" → `hotfix/`
   - Keywords like "feature", "add", "implement", "create", "new" → `feat/`
3. **If type cannot be determined:** Use AskUserQuestion tool to ask the user to select between: Feature, Fix, or Hotfix

## 3. Sanitize the branch name
- Convert to lowercase
- Replace spaces and underscores with hyphens
- Remove any characters that are not [a-z0-9-]
- Ensure it does not contain slashes (no nested folders)
- Trim leading/trailing hyphens
- Remove any flags (--feat, --fix, --hotfix, --base-branch and its value) from the name

## 4. Determine base branch
- Check for `--base-branch <value>` in $ARGUMENTS
- If `--base-branch .` or `--base-branch current` → use current branch (from context above)
- If `--base-branch <branch>` → use the specified branch name
- If not provided → default to `main`

## 5. Create the worktree
- Execute: `git worktree add <branch-name> -B <type>/<branch-name> <base-branch>`
- Where `<type>` is one of: feat, fix, hotfix
- Where `<base-branch>` is resolved from step 4

## 6. Print summary
- The worktree path created
- The full branch name created (with prefix)
- The base branch used
- Instructions on how to navigate to the new worktree (e.g., `cd ../<branch-name>`)
