# Workflow 1: Roadmap Builder

## Purpose

Generate a personalized and structured learning roadmap through an interactive process of 6 rounds with 14 total questions. The resulting roadmap will have 3 progression levels (Beginner → Intermediate → Advanced), with practical projects, integrated Feynman technique, and recommended resources.

## When to Activate

This workflow activates when:
- User wants to "create", "generate", "make" a roadmap or learning plan
- User mentions "I want to learn [topic]", "how do I start with [topic]"
- User doesn't have an existing roadmap and needs structure

## Prerequisites

- None (this is the entry point of the learning system)
- Access to `AskUserQuestion` (preferred) or ability to ask questions in text

## Output

A markdown file named `<topic>_learning_plan.md` with:
- User's learning profile
- Mermaid diagram of progression
- 3 levels with concepts, practical projects, Feynman technique, and resources
- Validation plan and success metrics

---

## Process Overview

```
Phase 1: Information Gathering (6 Rounds, 14 Questions)
   ↓
Phase 2: Processing and Analysis
   ↓
Phase 3: Document Generation
```

---

## PHASE 1: Information Gathering

### IMPORTANT: Use of AskUserQuestion

**ALWAYS USE `AskUserQuestion` WHEN AVAILABLE** for all questions.

**If NOT available:** Ask questions in plain text and wait for user responses.

---

### Round 1: Topic, Context and Scope (3 questions)

#### Question 1
**"What topic or concept do you want to master?"**
- Type: Open input (no predefined options)
- Captures: Main topic the user wants to learn

**Example responses:**
- "Machine Learning"
- "Distributed Systems Design"
- "React and Frontend development"

---

#### Question 2
**"In what primary context will you apply this knowledge?"**
- Type: Single-select
- Options:
  * Work/Professional
  * Personal project
  * Academic/Certification
  * Entrepreneurship
  * Curiosity/Personal development

---

#### Question 3
**"Is there a specific area within this topic?"**
- Type: Open input
- Purpose: Refine the roadmap scope

**Examples by topic:**
- If Machine Learning: "NLP", "Computer Vision", "Forecasting", "Reinforcement Learning"
- If JavaScript: "Frontend", "Backend", "Full-Stack"
- If Systems Design: "Microservices", "Event-Driven", "High Availability"

---

### Round 2: Current Level and Experience (2 questions)

#### Question 4
**"What is your current level in this topic?"**
- Type: Single-select
- Options:
  * No prior knowledge
  * Basic knowledge
  * Intermediate level
  * Advanced level (I want specialization)

---

#### Question 5
**"Do you have experience in related fields?"**
- Type: Open input
- Captures: Previous experience that can be leveraged

**Examples:**
- "Yes, I have 3 years of Python experience"
- "Yes, I know Docker and Kubernetes"
- "No, it's completely new to me"

---

### Round 3: Depth and Scope (3 questions)

#### Question 6
**"What depth of knowledge are you seeking?"**
- Type: Single-select
- Options:
  * Superficial (understand general concepts)
  * Moderate (functional practical application)
  * Deep (complete technical mastery)
  * Specialization (become an expert in a sub-area)

---

#### Question 7
**"Which specific areas of the topic interest you most?"**
- Type: Multi-select (user can select multiple)
- Options:
  * Theoretical fundamentals
  * Practical application
  * Real use cases
  * Tools and frameworks
  * Patterns and best practices
  * Performance and optimization
  * Security
  * Scalability

---

#### Question 8
**"Are there areas you want to exclude or deprioritize?"**
- Type: Open input
- Captures: Areas to avoid or reduce in the roadmap

**Examples:**
- "I'm not interested in pure theoretical aspects"
- "Deprioritize performance topics"
- "Exclude certifications and exams"

---

### Round 4: Specific Application Context (2 questions)

#### Question 9
**"Do you have a specific project, role or problem you want to solve?"**
- Type: Open input
- Captures: Specific practical objective

**Examples:**
- "I want to build a REST API for my startup"
- "I need to optimize queries in an existing database"
- "I'm going to lead a frontend development team"

---

#### Question 10
**"Are there technological or domain constraints I should know about?"**
- Type: Open input
- Captures: Limitations or technical requirements

**Examples:**
- "Only open-source technologies"
- "Must be compatible with Python 3.8+"
- "We work with financial data (compliance)"
- "No access to GPUs for training"

---

### Round 5: Learning Style and Time (2 questions)

#### Question 11
**"What is your preferred learning style?"**
- Type: Single-select
- Options:
  * Practical (hands-on, real projects from the start)
  * Theoretical (concepts and fundamentals first)
  * Learning-by-example (see how others do it)
  * Mixed (flexible depending on the stage)

---

#### Question 12
**"How much time can you invest in this learning?"**
- Type: Single-select
- Options:
  * Less than 1 month (intensive learning)
  * 1-3 months (moderate pace)
  * 3-6 months (deep learning)
  * 6-12 months (specialization)
  * No time limit (at my own pace)

---

### Round 6: Objectives and Metrics (2 questions)

#### Question 13
**"What is your measurable final objective?"**
- Type: Single-select
- Options:
  * Complete a specific project
  * Pass a certification
  * Get a job/role
  * Reach a mastery level
  * Solve a specific problem
  * Teach others

---

#### Question 14
**"Are there resources or tools you already know that you want to leverage?"**
- Type: Open input
- Captures: Prior knowledge that can be leveraged

**Examples:**
- "I know Git and GitHub well"
- "I handle React, want to apply it in this learning"
- "I have access to Coursera courses"

---

## PHASE 2: Processing and Analysis

Once all 14 responses are collected, Claude must:

### 1. Create User Profile

Synthesize information into a clear profile:

```
- Topic and specific area
- Application context (work, personal, etc.)
- Current level and previous experience
- Desired depth
- Selected focus areas
- Areas to exclude/deprioritize
- Technological constraints
- Specific project/problem (if exists)
- Learning style
- Available time
- Measurable final objective
- Known resources/tools
```

### 2. Design 3-Level Structure

Based on the profile, design:

**Level 1: Beginner - Fundamentals**
- 3-5 key concepts contextualized to the user's area
- Each concept with simple practical project
- Specific Feynman tips
- Recommended resources

**Level 2: Intermediate - Deep Application**
- 4-6 more advanced concepts
- More complex projects that solve context problems
- Feynman technique for consolidation
- Intermediate resources

**Level 3: Advanced - Specialization**
- 3-4 specialized concepts according to chosen sub-area
- Integrating project that combines multiple concepts
- Feynman technique for mastery
- Advanced resources

### 3. Adapt According to Context

**Important considerations:**

- If user has prior experience → Adjust Level 1 or start at Level 2
- If style is "practical" → More projects, less theory
- If style is "theoretical" → More fundamentals, detailed explanations
- If there are technological constraints → Only recommend compatible resources
- If objective is "certification" → Include preparation resources
- If time is limited → More compact and focused roadmap

---

## PHASE 3: Document Generation

Read the template in `templates/roadmap_template.md` and generate the file following EXACTLY that structure.

### File Naming

Format: `<topic>_learning_plan.md`

**Examples:**
- `AI_Agents_learning_plan.md`
- `Kubernetes_learning_plan.md`
- `React_Frontend_learning_plan.md`

### File Location

1. **Try first:** Save in current execution directory
2. **If fails:** Ask user: "Where do you want me to save the roadmap?"

### File Content

The file must contain (according to template):

1. **Personalized Header** with complete learning profile
2. **Visual Diagram (Mermaid)** showing 3 levels and flow
3. **Level 1:** 3-5 concepts with description, project, Feynman, resources
4. **Level 2:** 4-6 concepts with description, project, Feynman, resources
5. **Level 3:** 3-4 concepts with description, integrating project, Feynman, resources
6. **Integrated Feynman Guide** explaining how to use the technique
7. **Validation Plan** with milestones and success metrics

---

## Quality Checklist

Before delivering the roadmap, verify:

- [ ] Concepts are **contextualized** to the user's area (not generic)
- [ ] Practical projects are **relevant** to the application context
- [ ] Estimated time is **realistic** according to user's available time
- [ ] Selected **focus areas** are respected
- [ ] Areas the user asked to avoid are **excluded/deprioritized**
- [ ] **Technological constraints** are considered
- [ ] Recommended resources are **quality** and accessible
- [ ] **Final objective** is present and measurable
- [ ] Mermaid diagram is **clear and visual**
- [ ] Feynman technique is **integrated** at each level

---

## Post-Generation

Once the file is generated:

1. **Confirm to user** that the roadmap was created
2. **Show the path** of the generated file
3. **Recommend next steps using `AskUserQuestion`**

### Step 3.1: Present Next Steps Options

**MANDATORY: USE `AskUserQuestion`**

**Question (via AskUserQuestion):**
"Excellent! Your roadmap is ready. What's your next step?"

**Options:**
1. **Deep dive into a concept**
   - Description: Use Deep Dive to explore in depth a specific concept from the roadmap (Workflow 2)
2. **Generate a practical activity**
   - Description: Create a hands-on activity to practice a concept from the roadmap (Workflow 4)
3. **Validate understanding with Feynman**
   - Description: Use the Feynman Technique to explain what you already know (Workflow 3)
4. **Do nothing for now**
   - Description: End here and work with the roadmap at your own pace

### Step 3.2: Act According to Response

**If responds Option 1 (Deep Dive):**
- Indicate that the Deep Dive workflow will begin
- Say: "Perfect, let's dive deep. I need you to tell me which concept from the roadmap you want to explore thoroughly."
- Activate Workflow 2 (Deep Dive Learning)

**If responds Option 2 (Practice Generator):**
- Indicate that the Practice Generator workflow will begin
- Say: "Excellent, let's generate a personalized practical activity. Which of the roadmap concepts do you want to practice?"
- Activate Workflow 4 (Practice Generator)

**If responds Option 3 (Feynman):**
- Indicate that the Feynman Review workflow will begin
- Say: "Perfect, let's validate your understanding using the Feynman Technique. What concept from the roadmap do you want to explain and have me review?"
- Activate Workflow 3 (Feynman Review)

**If responds Option 4 (Do nothing):**
- Say goodbye to user positively
- Say: "Alright, you have your roadmap ready for when you need it. When you want to deep dive, practice or validate your understanding, I'll be here to help you. Good luck with your learning!"

---

## Error Handling

### If critical information is missing
- Request clarification before continuing
- Don't assume responses

### If user cancels halfway
- Offer to save partial progress
- Allow resuming later

### If file cannot be saved
- Inform user clearly
- Offer alternative (show in terminal, another location)

---

## Examples

### Example 1: Advanced User

```
User: "I want to learn AI Agents, I already know Python and basic LLMs"

Claude processes:
- Current level: Intermediate
- Experience: Python, LLMs
- Decision: Start roadmap at Level 2 or compact Level 1
```

### Example 2: User with Constraints

```
User responds:
- Constraints: "Only open-source, no GPUs"
- Objective: "Build chatbot for my company"

Claude processes:
- Exclude: Fine-tuning that requires GPUs
- Include: RAG, prompting, LLM APIs (OpenAI/Anthropic)
- Projects: Chatbot with retrieval over company documents
```

### Example 3: Fast Learning

```
User responds:
- Time: "Less than 1 month"
- Style: "Practical"

Claude processes:
- Compact roadmap: 2-3 concepts per level
- Intensive projects from the start
- Resources: Hands-on tutorials, fewer theoretical papers
```

---

## Success Criteria

This workflow works correctly when:

- ✅ All 14 user responses are collected
- ✅ Generated roadmap faithfully reflects user profile
- ✅ Concepts are contextualized (not generic)
- ✅ Projects are feasible and relevant
- ✅ File is saved correctly
- ✅ User can start working with the roadmap immediately

---

**Version:** 1.0
**Workflow ID:** 01_roadmap_builder
