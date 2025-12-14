# Claude Code Plugins

Built for [Claude Code](https://docs.anthropic.com/en/docs/claude-code), by Claude Code, with a human pressing "Enter".

## Installation

### Option 1: Add as Plugin Registry (Recommended)

Add this repository as a plugin registry to browse and install plugins:

```bash
claude plugins:registry:add https://github.com/dovixman/claude-code-plugins
```

Then install any plugin:

```bash
claude plugins:install adaptive-learning
claude plugins:install code-workflow
claude plugins:install problem-solving
claude plugins:install project-insights
```

### Option 2: Direct Installation from GitHub

Install a specific plugin directly:

```bash
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/adaptive-learning
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/code-workflow
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/problem-solving
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/project-insights
```

### Option 3: Local Installation

Clone the repository and install locally:

```bash
git clone https://github.com/dovixman/claude-code-plugins.git
claude plugins:install ./claude-code-plugins/adaptive-learning
```

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

## Publishing Your Own Plugins

To add your own plugin repository to the Claude Code marketplace:

1. Create a repository with your plugins following the `.claude-plugin/` structure
2. Each plugin folder should contain:
   ```
   your-plugin/
   ├── .claude-plugin/
   │   ├── plugin.json       # Plugin metadata
   │   ├── commands/         # Slash commands
   │   └── skills/           # Skills (optional)
   └── README.md
   ```
3. Users can then add your repository as a registry:
   ```bash
   claude plugins:registry:add https://github.com/your-username/your-plugins
   ```
