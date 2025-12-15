---
name: adaptive-learning
description: Modular adaptive learning system that creates personalized roadmaps, deepens topics through progressive questions, validates understanding with Feynman Technique, and generates practical activities. Use when users request a learning plan, want to dive deeper into topics, validate comprehension, or need practical exercises.
---

# Adaptive Learning Skill

## Description

Modular adaptive learning system that combines structured planning, progressive deepening, knowledge validation through the Feynman Technique, and practical activity generation. This skill transforms the learning process into an iterative cycle of planning → deepening → validation → practice.

## When to Use This Skill

Claude should activate this skill when users:

- **Want to create a structured and personalized learning plan** on any topic
- **Need to deepen understanding in specific topics** from an existing roadmap through progressive questions
- **Want to validate their understanding** using the Feynman Technique and receive detailed feedback
- **Need practical activities** to apply acquired knowledge
- **Want guided teaching** from a professor who explains roadmap topics with adaptive depth levels

**Common trigger phrases:**
- "create a roadmap", "learning plan", "I want to learn about"
- "deepen my understanding", "learn more about", "explore in depth"
- "check my knowledge", "validate my understanding", "feynman technique"
- "generate practice", "practical activity", "exercise"
- "teach me", "explain this to me", "be my teacher", "teacher mode", "I want lessons about"

## Core Principles

This skill is based on proven principles of effective learning:

1. **Active Learning:** Users build knowledge through explanation, not just content consumption
2. **Feynman Technique:** If you can't explain something simply, you don't fully understand it
3. **Deliberate Practice:** Applying knowledge in real contexts reinforces learning
4. **Continuous Iteration:** Learning is cyclical: deepen → validate → practice → repeat
5. **Personalization:** Every roadmap and activity adapts to the user's context, level, and objectives

## Architecture Overview

This skill consists of **5 independent modular workflows**, each with its specific purpose:

### 1. **Roadmap Builder**
- **File:** `workflows/01_roadmap_builder.md`
- **Purpose:** Create personalized learning plans through an interactive 6-round process (14 questions)
- **Output:** File `<topic>_learning_plan.md` with 3-level structure, practical projects, and integrated Feynman technique

### 2. **Deep Dive Learning**
- **File:** `workflows/02_deep_dive.md`
- **Purpose:** Deepen understanding in specific subtopics from a roadmap through progressive and contextual questions
- **Output:** Interactive conversation that expands user knowledge without limit until they decide to stop

### 3. **Feynman Review**
- **File:** `workflows/03_feynman_review.md`
- **Purpose:** Validate user understanding using the Feynman Technique, identifying gaps and strengths
- **Output:** Detailed report with constructive feedback (terminal and/or markdown file)

### 4. **Practice Generator**
- **File:** `workflows/04_practice_generator.md`
- **Purpose:** Generate personalized practical activities to apply knowledge from a roadmap
- **Output:** Hands-on activity with objectives, steps, success criteria, and resources

### 5. **Teacher Mode**
- **File:** `workflows/05_teacher_mode.md`
- **Purpose:** Act as a proactive professor explaining topics from an existing roadmap with adaptive depth levels
- **Output:** Interactive teaching session with pedagogical explanations and related learning paths

## Workflow Decision Logic

Claude should follow this process to determine which workflow to activate:

### Step 1: Identify User Intent

Analyze the user's request and classify it according to these patterns:

#### **Roadmap Builder Triggers:**
- User mentions wanting to "create", "generate", or "build" a roadmap or learning plan
- Phrases: "I want to learn [topic]", "how do I start with [topic]", "I need structure to learn"
- User doesn't have an existing roadmap and wants to start from scratch
- **Action:** Read `workflows/01_roadmap_builder.md` and `templates/roadmap_template.md`

#### **Deep Dive Triggers:**
- User mentions "deepen", "learn more about", "explore in depth", "understand better"
- User already has a roadmap and wants to work on a specific subtopic
- Phrases: "I want to understand better [roadmap subtopic]", "deepen my knowledge of [concept]"
- **Action:** Read `workflows/02_deep_dive.md`

#### **Feynman Review Triggers:**
- User wants to "explain", "validate understanding", "get feedback", "check knowledge"
- Explicitly mentions "Feynman technique" or "how well do I understand"
- Phrases: "I'll explain what I learned", "give me feedback on my understanding"
- **Action:** Read `workflows/03_feynman_review.md` and `templates/feynman_report_template.md`

#### **Practice Generator Triggers:**
- User asks for "practice", "exercise", "activity", "project to apply"
- Phrases: "generate practical activity about [topic]", "what can I do to practice"
- User has roadmap and wants specific activity for a subtopic
- **Action:** Read `workflows/04_practice_generator.md` and `templates/practice_activity_template.md`

#### **Teacher Mode Triggers:**
- User mentions "teach me", "explain", "be my teacher", "professor mode", "lessons about"
- User wants guided teaching of roadmap topics with adaptive depth levels
- Phrases: "teach me about [topic]", "I want you to teach me", "teacher mode", "give me lessons"
- User has a roadmap and wants pedagogical explanations
- **Action:** Read `workflows/05_teacher_mode.md`

### Step 2: Load Corresponding Workflow

Once the workflow is identified:

1. **Read the workflow file** using `file_read`
2. **Read necessary templates** if the workflow requires them
3. **Follow the workflow instructions step by step** exactly as written
4. **Use `AskUserQuestion` when available** for structured interactions

**Example flow:**

```
User: "I want to create a learning plan for AI Agents"

Claude (internal thinking):
1. Identify: User wants to create roadmap → Roadmap Builder trigger
2. Read: workflows/01_roadmap_builder.md
3. Read: templates/roadmap_template.md
4. Execute: Follow 6-round question process
5. Output: Generate <topic>_learning_plan.md file
```

### Step 3: Handling Ambiguity

If the user's intent is unclear:

1. **Ask directly** what they want to do
2. **Offer clear options:**
   - "Do you want to create a new roadmap?"
   - "Do you want to deepen your understanding of a topic in an existing roadmap?"
   - "Do you want me to review your understanding of something you learned?"
   - "Do you want to generate a practical activity?"
   - "Do you want me to teach you about topics from a roadmap?"

## Tools Required

This skill requires access to the following tools:

- **`AskUserQuestion`** (preferred when available) - For structured interactive questions
- **`file_read`** - To read workflows, templates, and existing roadmaps
- **`file_create`** - To create roadmaps, reports, and activities
- **`view`** - To view existing roadmaps if necessary

## Important Notes

### Working Directory

Generated files (roadmaps, reports, activities) should be saved:

1. **First option:** In the current directory where Claude Code is executed
2. **If not possible:** Explicitly ask the user where they want to save the file

### Using AskUserQuestion

**WHENEVER THE `AskUserQuestion` TOOL IS AVAILABLE**, use it for:
- The 14 questions in the Roadmap Builder
- Questions in the Feynman Review
- Any interaction requiring structured user input

If `AskUserQuestion` is NOT available:
- Use normal text questions
- Wait for user responses
- Continue the workflow normally

### Error Handling

- If a workflow requires an existing roadmap and the user doesn't provide one, ask for the path explicitly
- If a file can't be read, inform the user clearly and offer alternatives
- If the user cancels mid-process, save progress if possible

## Quick Start Examples

### Example 1: Create Roadmap
```
User: "I want to learn Kubernetes from scratch"

Claude: [Reads workflows/01_roadmap_builder.md]
        [Starts 6-round process]
        "Perfect! I'll help you create a personalized roadmap for learning
        Kubernetes. Let's start with the first round of questions..."
```

### Example 2: Deep Dive into Topic
```
User: "I have a roadmap at ~/learning/kubernetes_plan.md and want to deepen
       my understanding of 'Container Networking'"

Claude: [Reads workflows/02_deep_dive.md]
        [Reads the user's roadmap]
        "Great, I see 'Container Networking' is one of the concepts in Level 2
        of your roadmap. Let's deepen your understanding through progressive
        questions. Ready to start?"
```

### Example 3: Validate Knowledge
```
User: "I want you to review my understanding of RAG"

Claude: [Reads workflows/03_feynman_review.md]
        "Perfect, I'll use the Feynman Technique to help you validate your
        understanding. Go ahead, explain in your own words what RAG is and
        how it works..."
```

### Example 4: Generate Practice
```
User: "I need a practical activity for the 'Advanced Prompting' concept
       from my roadmap at ~/ai_learning_plan.md"

Claude: [Reads workflows/04_practice_generator.md]
        [Reads the roadmap]
        "Perfect, I see 'Advanced Prompting' is in Level 2 of your roadmap.
        I'll generate a hands-on practical activity to help you apply this
        knowledge..."
```

### Example 5: Teacher Mode
```
User: "Teach me about the topics in my roadmap at ~/AI_learning_plan.md"

Claude: [Reads workflows/05_teacher_mode.md]
        [Reads the user's roadmap]
        "Great! I'll be your teacher. I see your roadmap has several interesting
        topics. Which one would you like to learn about?
        [Offers 4-6 topic options]"

→ After selecting a topic:
        "What depth level would you prefer? Basic, Intermediate, or Ultra Expert?"

→ After selecting depth:
        "Perfect! Let me explain [Topic] at [Level]... [Pedagogical explanation]

        What would you like to do next?
        1. Still have questions about this topic?
        2. Learn about [Related Topic 1]
        3. Learn about [Related Topic 2]
        4. Exit Teacher Mode"
```

## Success Criteria

This skill works correctly when:

- ✅ Claude correctly identifies which workflow to activate based on the user's request
- ✅ Generated roadmaps exactly follow the template format
- ✅ Deepening questions are progressive and contextual
- ✅ Feynman feedback is constructive, specific, and useful
- ✅ Practical activities are doable and relevant to the user's context
- ✅ Files are saved in the correct location
- ✅ The user can navigate between workflows as needed

## Maintenance Notes

This skill should be reviewed/updated:
- When improvements to existing workflows are identified
- When new workflows are added
- When templates are updated
- When users report confusion or issues

---

**Version:** 1.0
**Last updated:** November 2024
