# Problem Solving Plugin

Mental models and frameworks for systematic problem-solving and root cause analysis.

## Installation

```bash
claude plugin install /path/to/problem-solving
# or
claude --plugin-dir /path/to/problem-solving
```

## Commands

### `/problem-solving:five-whys [issue_description] [depth:5]`

Find the root cause of a problem using the 5 Whys Framework.

The Five Whys is a problem-solving methodology that iteratively asks "why" to drill down from symptoms to root causes. It helps identify the fundamental reason behind a problem rather than addressing surface-level symptoms.

**Process:**
1. Start with the problem statement
2. Ask "Why did this happen?" and document the answer
3. For each answer, ask "Why?" again
4. Continue for at least 5 iterations (or until root cause is found)
5. Validate the root cause by working backwards
6. Propose solutions that address the root cause

**Example:**
```
Problem: Application crashes on startup
Why 1: Database connection fails
Why 2: Connection string is invalid
Why 3: Environment variable not set
Why 4: Deployment script missing env setup
Why 5: Documentation didn't specify env requirements
Root Cause: Missing deployment documentation
```

**Parameters:**
- `issue_description`: The problem or symptom to analyze
- `depth`: Number of "why" iterations (default: 5)

## Best Practices

- Don't stop at symptoms; keep digging for systemic issues
- Multiple root causes may exist - explore different branches
- Document each "why" for future reference
- Consider both technical and process-related causes
- The magic isn't in exactly 5 whys - stop when you reach the true root cause
