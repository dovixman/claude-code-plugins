# Project Insights Plugin

Project documentation and progress tracking tools. Generates architecture documentation and provides work reports based on git history and uncommitted changes.

## Installation

```bash
claude plugin install /path/to/project-insights
# or
claude --plugin-dir /path/to/project-insights
```

## Commands

### Documentation

#### `/project-insights:docs:architecture`

Analyze and document the project architecture.

**Creates comprehensive documentation including:**
- System overview and current state
- High-level architecture tree (ASCII art visualization)
- Architectural patterns identified (Hexagonal, Clean, MVC, etc.)
- Main code flow patterns with step-by-step arrows
- Data flow architecture
- Dependency injection wiring
- Testing strategy

**Output:**
Creates `architecture_tree.md` in `.claude_docs/` folder with:
- Visual tree diagrams
- Layer separation (Domain, Application, Infrastructure)
- Design patterns documentation
- File paths and line references

### Progress Reports

#### `/project-insights:report:daily`

Show a report of work done since yesterday.

Analyzes:
- Uncommitted changes in the current repository
- Git commit history since yesterday

#### `/project-insights:report:weekly`

Show a report of work done in the last week.

Analyzes:
- Uncommitted changes in the current repository
- Git commit history from the past 7 days

#### `/project-insights:report:custom since [date]`

Show a report of work done since a specific date.

**Examples:**
```bash
/project-insights:report:custom since 2024-01-15
/project-insights:report:custom since last monday
```

Analyzes:
- Uncommitted changes in the current repository
- Git commit history since the specified date

## Use Cases

- Onboarding new team members (architecture docs)
- Stand-up meetings (daily report)
- Sprint reviews (weekly report)
- Project retrospectives (custom date range)
- Understanding a new codebase
- Documenting legacy systems
