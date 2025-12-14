---
argument-hint: [--no-verify][--push][--no-split]
description: "Commit changes"
allowed-tools: Bash(git add:*), Bash(git status:*), Bash(git diff:*), Bash(git commit:*), Bash(git log:*)
---

# Context:
- Take the no-verify command from $ARGUMENTS or do not use it if not given.
- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

# Task:
- Read the latest changes on the current repository and prepare a single line message that describes them, do not make it very long, keep it short and clear.
- Once you have the message, format it following the Conventional Commits message convetion.
- If the current changes are from a service and the service belongs to a monorepo, add the name of the service as contexto between parenthesis on the Conventional Commit message.
- If the current changes are not on a monorepo, try to add some context between parenthesees so that the user knows where the changes are comming from.
- If there are multiple sources, create multiple commits, one for each.
- If the user has sent the "--no-verify" on the $ARGUMENTS, add the --no-verify to the commit or commits. 
- Finally, commit the changes.
- Unless the user explicitly sents the "--no-split" on the $ARGUMENTS, ALWAYS split the changes into multiple commits, grouping related changes on each commit, to have a clean, traceable commit history
- If the user sends the "--push" argument on the $ARGUMENTS, once commited push the changes, otherwise do not push anything.
- Print a resume for the user.
- Always create a one line commit messages, not huge messages with too much context.
- Never mention Claude or Claude Code in the commit messages.
