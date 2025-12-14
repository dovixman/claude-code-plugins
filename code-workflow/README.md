# Code Workflow Plugin

Complete development workflow toolkit covering TDD implementation, git worktree management, smart commits, quality assurance testing, and architectural improvements.

## Installation

```bash
claude plugin install /path/to/code-workflow
# or
claude --plugin-dir /path/to/code-workflow
```

## Commands

### Development

#### `/code-workflow:dev:tdd-implement [feature-description]`

Implement a feature using Test-Driven Development (TDD).

**Process:**
1. Analyze requirements for the feature
2. Create comprehensive tests defining expected behavior
3. Verify tests fail (Red)
4. Implement minimum code needed to pass tests (Green)
5. Refactor while keeping tests passing (Refactor)

**Principles enforced:**
- Tests must be written before implementation
- Tests must fail initially
- Implementation should be minimal to pass tests
- Files should not exceed 300 lines

### Git Operations

#### `/code-workflow:git:worktree [--feat|--fix|--hotfix] [--base-branch <branch>] [branch_name]`

Create and use a new git worktree with automatic branch naming.

**Features:**
- Auto-detects task type from keywords (feature, fix, hotfix)
- Sanitizes branch names (lowercase, hyphens, no special chars)
- Creates worktree with proper prefix (`feat/`, `fix/`, `hotfix/`)
- Supports custom base branch (`--base-branch main|develop|.`)

**Examples:**
```bash
/code-workflow:git:worktree --feat user-authentication
/code-workflow:git:worktree --fix login-bug --base-branch develop
/code-workflow:git:worktree add logout button  # Auto-detects as feat/
```

#### `/code-workflow:git:commit [--no-verify] [--push] [--no-split]`

Smart commit with Conventional Commits format.

**Features:**
- Analyzes current changes and creates descriptive commit messages
- Follows Conventional Commits convention
- Adds context (service name for monorepos)
- Splits changes into multiple commits by default (unless `--no-split`)
- Optionally pushes after commit (`--push`)
- Supports `--no-verify` for bypassing hooks

### Quality Assurance

#### `/code-workflow:qa:analize`

Analyze the current project as a QA specialist.

**Performs:**
- Automated testing execution (unit, integration)
- Linting and formatting checks
- Type checking
- Build validation
- Security vulnerability checks
- Test coverage analysis

**Validation gates:**
- All unit/integration tests pass
- No linting errors
- Type checking passes
- Build succeeds without warnings
- No security vulnerabilities

#### `/code-workflow:qa:test [file_to_test] [existing_test_reference]`

Create or update tests for a given file.

**Features:**
- Uses existing test structure and style from the project
- Reuses test configuration (conftest.py, fixtures, etc.)
- Runs tests after creation to verify they pass
- Fixes failing tests iteratively

#### `/code-workflow:qa:improvements`

Analyze and suggest architectural improvements.

**Analysis areas:**
- Separation of concerns
- Dependency management
- Testing coverage and strategy
- Error handling patterns
- Performance considerations
- Security practices

**Output:**
Creates `architectural_improvements.md` with:
- Current architecture analysis
- Prioritized improvement recommendations (Critical → High → Medium → Low)
- Implementation roadmap
- Code examples (before/after)
- Testing strategy improvements
- Security enhancements

## Use Cases

- Starting a new feature with TDD
- Managing parallel work with git worktrees
- Creating clean, semantic commit history
- Ensuring code quality before PR
- Creating tests for legacy code
- Identifying architectural debt
