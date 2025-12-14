# Adaptive Learning Plugin

Modular adaptive learning system that creates personalized roadmaps, deepens topics through progressive questions, validates understanding with the Feynman Technique, and generates practical activities.

## Installation

```bash
# From GitHub
claude plugins:install https://github.com/dovixman/claude-code-plugins/tree/main/adaptive-learning

# Or add the registry first, then install by name
claude plugins:registry:add https://github.com/dovixman/claude-code-plugins
claude plugins:install adaptive-learning
```

## Commands

### `/adaptive-learning:roadmap [topic]`

Generate a personalized learning roadmap with deep context understanding.

Uses a comprehensive 6-round questioning system to understand:
- What you want to learn and in what context
- Your current level and prior experience
- Desired depth and specific areas of focus
- Learning style and time constraints
- Measurable goals

Produces a 3-level progression roadmap (Beginner → Intermediate → Advanced) with:
- Contextualized concept descriptions
- Practical projects for immediate application
- Feynman technique tips for validation
- Curated resources

### `/adaptive-learning:feynman [topic]`

Validate your understanding using the Feynman Technique.

**How it works:**
1. You explain what you learned about a topic in your own words
2. The command analyzes your explanation for:
   - Missing key concepts
   - Unclear or poorly explained points
   - Conceptual errors or irrelevant information
   - Strengths in your explanation
3. Generates a detailed feedback report with:
   - Strong points identified
   - Missing concepts
   - Unclear points
   - Recommendations for improvement
   - Feynman score (0-10)

## Use Cases

- Creating a learning plan for a new technology
- Validating your understanding after studying
- Preparing for technical interviews
- Building expertise in a specific domain
- Self-assessment and knowledge gap identification
