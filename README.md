# Claude Code Plugins

A collection of plugins for [Claude Code](https://docs.anthropic.com/en/docs/claude-code) to enhance productivity and learning workflows.

## Plugins

### adaptive-learning

Modular adaptive learning system with 5 workflows:
- **Roadmap Builder** - Create personalized learning plans through interactive questions
- **Deep Dive** - Explore topics in depth through progressive questions
- **Feynman Review** - Validate understanding using the Feynman Technique
- **Practice Generator** - Generate hands-on activities for any concept
- **Teacher Mode** - Get guided teaching with adaptive depth levels

### code-workflow

Development workflow tools:
- **TDD Implementation** - Test-driven development workflow
- **Git Worktree** - Create and manage git worktrees
- **Git Commit** - Structured commit workflow
- **QA Analysis** - Code quality analysis
- **QA Testing** - Test generation and management
- **QA Improvements** - Architecture improvement suggestions

### problem-solving

Problem analysis frameworks:
- **Five Whys** - Root cause analysis using the 5 Whys technique

### project-insights

Documentation and reporting:
- **Architecture** - Analyze and document project architecture
- **Daily Report** - Activity report since yesterday
- **Weekly Report** - Activity report since a week ago
- **Custom Report** - Activity report from a custom date

## Installation

```bash
claude plugins:install /path/to/plugin-folder
```

Or install directly from GitHub:

```bash
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/adaptive-learning
```

## License

MIT
