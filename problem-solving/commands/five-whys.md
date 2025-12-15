---
argument-hint: "[issue_description][depth:5]"
description: "Find the root cause of a problem using the 5-Why's Framework"
---

# Task:
Apply the Five Whys root cause analysis technique to investigate issues described in $ARGUMENTS

## Description
This command implements the Five Whys problem-solving methodology, iteratively asking "why" to drill down from symptoms to root causes. It helps identify the fundamental reason behind a problem rather than just addressing surface-level symptoms.

## Variables
- issue_description: The problem or symptom to analyze (If not give, ask the user for it)
- depth: Number of "why" iterations (default: 5, can be adjusted)

## Steps
1. Start with the problem statement found at the issue_description variable on $ARGUMENTS
2. Ask "Why did this happen?" and document the answer
3. For each answer, ask "Why?" again
4. Continue for at least 5 iterations or until root cause is found
5. Validate the root cause by working backwards
6. Propose solutions that address the root cause

## Examples
### Example 1: Application crash analysis
```
Problem: Application crashes on startup
Why 1: Database connection fails
Why 2: Connection string is invalid
Why 3: Environment variable not set
Why 4: Deployment script missing env setup
Why 5: Documentation didn't specify env requirements
Root Cause: Missing deployment documentation
```

### Example 2: Performance issue investigation
Systematically trace why a feature is running slowly by examining each contributing factor.

## Notes
- Don't stop at symptoms; keep digging for systemic issues
- Multiple root causes may exist - explore different branches
- Document each "why" for future reference
- Consider both technical and process-related causes
- The magic isn't in exactly 5 whys - stop when you reach the true root cause
