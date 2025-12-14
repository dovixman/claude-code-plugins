---
description: "Analyze and document project architecture"
---

# Task
You are tasked with creating a comprehensive tree-like structure documentation of a codebase's overall architecture and code flows. Follow these steps:

## Analysis Phase
1. **Explore the codebase structure** using LS and Glob tools to understand the project layout
2. **Identify the architectural pattern** (e.g., Hexagonal, Clean Architecture, MVC, etc.)
3. **Read key files** to understand:
   - Main entry points (main.py, index.js, etc.)
   - Domain models and entities
   - Service layers and business logic
   - External adapters and interfaces
   - Configuration and dependency injection

## Documentation Creation
1. **Create private .claude_docs folder** if it doesn't exist in the project root
2. **Generate architecture_tree.md** with the following structure:

### Required Sections:
- **📋 Overview**: Brief description of the system
- **🎯 Project purpose and goals**
- **🏗️ High-Level Architecture Tree**: Visual tree structure using ASCII art and emojis
- **🔄 Main Code Flow Patterns**: Key operational flows with arrows and steps
- **🔗 Key Architectural Patterns**: Patterns used (Strategy, Factory, Saga, etc.)
- **📊 Data Flow Architecture**: How data moves through the system
- **🔌 Dependency Injection Wiring**: How services are wired together
- **🧪 Testing Strategy**: Test organization and approaches

### Formatting Guidelines:
- Use emojis for visual clarity (🏗️🔄📊🎯🌐etc.)
- Create ASCII tree structures with proper indentation
- Show flow directions with arrows (↓ → ←)
- Include file paths and line references where relevant
- Use code blocks for specific implementations
- Organize by layers (Domain, Application, Infrastructure)

## Output Requirements:
- Save documentation to a private folder with the filename: `architecture_tree.md`
- Include visual tree diagrams
- Show clear separation of concerns
- Document key design patterns used
- Explain data flow and processing pipelines
- Include testing strategy if present

This command will produce comprehensive architecture documentation that helps developers understand the system's structure, patterns, and data flows at a glance.
