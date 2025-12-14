# Workflow 3: Feynman Review

## Purpose

Implement the Feynman Technique interactively: the user explains what they've learned in their own words, and the system listens carefully, analyzes the explanation, and identifies missing concepts, confusing points, conceptual errors, and strengths. Finally, it generates a detailed report with constructive feedback.

**IMPORTANT: Language Adaptation**
All questions, feedback, and the final report must be in the same language the user writes in. If the user writes in Spanish, respond in Spanish. If they write in English, respond in English. If they use another language, match that language.

## When to Activate

This workflow activates when:
- User wants to "explain", "validate understanding", "get feedback", "review knowledge"
- User explicitly mentions "Feynman technique" or "how well do I understand"
- Phrases like: "I'll explain what I learned", "give me feedback on my understanding"

## Prerequisites

- None (user just needs to be ready to explain something)
- Optional: Knowledge of the topic the user will explain (for better feedback)

## Output

- Detailed report with constructive feedback on user's explanation
- Format: Terminal and/or markdown file (according to user preference)
- Identification of gaps, errors, strengths, and recommendations

---

## Process Overview

```
Phase 1: Capture the Topic
   ↓
Phase 2: Explanation and Analysis Loop
   ↓
Phase 3: Process Feedback
   ↓
Phase 4: Generate Report
   ↓
Phase 5: Deliver Report
```

---

## PHASE 1: Capture the Topic

### Step 1.1: Verify if User Provided a Topic

If the user did NOT explicitly mention what topic they'll explain:

**MANDATORY: USE `AskUserQuestion`**

**IMPORTANT:** This step ALWAYS uses the `AskUserQuestion` tool. No text alternative.

**Question (via AskUserQuestion):** (in user's language)
"What is the specific topic or subject you want me to give feedback on?"

**Validate the response:**
- Is it a concrete and well-defined topic?
- Or is it too vague or mixing multiple areas?

**Examples:**

✅ **Clear topics:**
- "REST APIs in Python"
- "RAG in AI Agents"
- "Tokenization in LLMs"
- "Multi-Agent Architectures"

❌ **Vague topics:**
- "Programming in general" (too broad)
- "AI stuff" (not specific)
- "Everything I learned this week" (no focus)

### Step 1.2: Clarify if Necessary

If the topic is vague or mixing multiple areas:

**MANDATORY: USE `AskUserQuestion`**

**Step 1: Notify user that topic is vague**

Tell the user: (in user's language)
"The topic you mentioned ('**[VAGUE TOPIC]**') is too broad or not specific enough for me to give you truly useful feedback.

I need it to be more concrete and focused. For example:
- Instead of 'Programming' → 'REST APIs in Python'
- Instead of 'AI' → 'Tokenization in LLMs'
- Instead of 'Development' → 'Testing with pytest'

Let me help you specify exactly what topic you want to evaluate."

**Step 2: Use `AskUserQuestion` to get specific topic**

**Question (via AskUserQuestion):** (in user's language)
"What is the SPECIFIC topic you want me to evaluate? Be as concrete as possible."

**Options to provide:**
- **Option A:** [Concrete suggestion based on what they mentioned - if applicable]
- **Option B:** [Another concrete alternative suggestion]
- **Option C:** Other (allows them to write a specific topic freely)

**Examples of options based on original input:**

If they said "Programming":
- "REST APIs in Python"
- "Exception handling in Python"
- "Other" (write a specific one)

If they said "AI":
- "Tokenization in LLMs"
- "Embeddings and semantic similarity"
- "Other" (write a specific one)

If they said "Development stuff":
- "Microservices Architecture"
- "Testing with pytest"
- "Other" (write a specific one)

**Step 3: Validate response**

- Is it concrete and focused?
- Doesn't it mix multiple concepts?

If still vague:
- Say: "That topic is still a bit broad. Can you be more specific? For example, instead of '[TOPIC]', you could say '[MORE SPECIFIC EXAMPLE]'."
- Use `AskUserQuestion` again until you have a clear topic

If it's clear:
- Continue to Step 1.3 (Confirm the Topic)

### Step 1.3: Confirm the Topic

Once you have a clear topic:

**Confirm:** (in user's language)
"Perfect, I'm ready to listen to your explanation about **[TOPIC]**.

Take your time and explain in your own words:
- What is [TOPIC]?
- How does it work?
- Why is it important?
- When and how is it used?

Go ahead, I'm listening carefully."

**DO NOT continue until you have a clear and confirmed topic.**

---

## PHASE 2: Explanation and Analysis Loop

### 2.1: Listen to User's Explanation

The user will begin explaining the topic. Claude should:

**Listen carefully** to the complete explanation without interrupting.

### 2.2: Mental Analysis of Explanation

**IMPORTANT:** This analysis is done internally and is NOT shared with the user yet.

For each explanation, analyze:

#### A) Key Concepts of the Topic

**Ask yourself:**
- What are the fundamental concepts that should be covered in this topic?
- Which of these concepts did the user mention?
- Which important concepts were completely missing?

**Example for "RAG in AI Agents":**

Expected key concepts:
- Retrieval (search)
- Embeddings and semantic similarity
- Vector stores
- Augmented generation
- Context and token window
- Use cases

If user doesn't mention "embeddings" → Mark as missing concept

#### B) Clarity of Explanation

**Ask yourself:**
- Is the explanation clear and direct?
- Are there confusing or contradictory parts?
- Does the user use unnecessary jargon or explain simply?
- Can the concept be understood from reading their explanation?

**Identify:**
- Specific points that are unclear
- Contradictory explanations
- Use of terms without defining them

#### C) Conceptual Errors

**Ask yourself:**
- Is there incorrect information?
- Are there misunderstandings about how something works?
- Are there confusions between related concepts?

**Example of error:**
User says: "RAG searches Google to find information"
Error: RAG searches its own vector store, not Google

#### D) Irrelevant Information

**Ask yourself:**
- Did they include information that doesn't belong to the topic?
- Did they drift toward related but out-of-scope topics?

#### E) Explanation Strengths

**Identify:**
- What did they explain correctly and well?
- What parts were clear and precise?
- What concepts did they demonstrate understanding deeply?

### 2.3: Store Analysis for Final Report

**Keep in mind** (or in data structure):

```
Topic: [topic name]

Concepts mentioned: [list]
Concepts missing: [list]

Clear points: [list]
Confusing points: [list with specific details]

Conceptual errors: [list with correction]

Irrelevant information: [list]

Strengths: [list]
```

### 2.4: Ask if They Want to Explain More

**MANDATORY: USE `AskUserQuestion`**

**IMPORTANT:** This step ALWAYS uses the `AskUserQuestion` tool. No text alternative. If the tool is not available, wait until it is or explicitly notify the user.

**Question to ask (via AskUserQuestion):** (in user's language)

```
Question: "Would you like to explain more about this topic or about other topics related to your learning?"

Options:
1. "Yes, more about LLMs 101" (or the current topic)
   - Description: I want to expand my explanation with more details
2. "Yes, a different topic"
   - Description: I want to explain a different concept from my roadmap
3. "No, I'm ready for feedback"
   - Description: I think I've finished explaining everything needed
```

**Flow based on response:**

**If responds Option 1 or 2 (YES):**
- If Option 1: Say "Go ahead, explain more about [TOPIC]. I'm ready to listen."
- If Option 2: Ask via `AskUserQuestion` what the next specific topic is
  - Validate that it's a clear and well-defined topic (not vague)
  - Once confirmed, say: "Perfect, I'm ready to listen to your explanation about [NEW TOPIC]."
- Return to Step 2.1 (listen to explanation of new or expanded content)

**If responds Option 3 (NO):**
- Confirm: "Perfect, I have your explanation clear. I'm going to process the feedback now."
- Continue to Phase 3 (Process Feedback)

---

## PHASE 3: Process Feedback

Once the user has finished explaining all topics:

### 3.1: Consolidate Analysis of All Topics

If the user explained multiple topics, have separate analysis for each:

```
Topic 1: [complete analysis]
Topic 2: [complete analysis]
Topic 3: [complete analysis]
...
```

### 3.2: Evaluate General Comprehension Level

For each topic, assign a level:

**Comprehension scale:**
- **Basic:** Superficial understanding, many key concepts missing
- **Intermediate:** Good understanding but important gaps
- **Advanced:** Deep understanding, few gaps
- **Expert:** Complete and clear understanding, no conceptual errors

### 3.3: Assign Feynman Score (0-10)

For each topic:

**Scoring criteria:**

**10/10 - Excellent:**
- Clear, complete explanation, no errors
- Includes all key concepts
- Simple and direct
- No unnecessary jargon

**7-9/10 - Very Good:**
- Clear and mostly complete explanation
- Missing 1-2 minor concepts
- Some improvable points
- No major conceptual errors

**5-6/10 - Acceptable:**
- Functional but incomplete explanation
- Missing important concepts
- Some confusing or unclear points
- Possible minor errors

**3-4/10 - Needs Work:**
- Confusing or very incomplete explanation
- Missing many key concepts
- Several unclear points
- Conceptual errors present

**1-2/10 - Requires Deep Review:**
- Important conceptual confusion
- Incorrect information
- Concept can't be understood from the explanation

**0/10:**
- No explanation provided

---

## PHASE 4: Generate Report

Read the template at `templates/feynman_report_template.md` for the exact structure.

**IMPORTANT: All text in the final report must be in the same language the user wrote in.**

### Report Structure

The report must contain:

#### 1. Header

```markdown
# 📖 Feynman Technique Report

**Date:** [current date]
**User:** [name if available]

## Summary of Topics Evaluated

1. [Topic 1]
2. [Topic 2]
...
```

#### 2. Detailed Analysis per Topic

For EACH topic explained:

```markdown
---

## Topic: [Topic Name]

### Feynman Score: [X]/10

**Comprehension Level:** [Basic/Intermediate/Advanced/Expert]

---

### ✅ Strengths

- [Strong point 1 that was well explained with specific detail]
- [Strong point 2]
- [Strong point 3]

---

### ⚠️ Missing Concepts

- **[Concept 1]:** [Why it's important and what they should know]
- **[Concept 2]:** [Brief explanation of the missing concept]

---

### 🔍 Unclear or Confusing Points

- **[Point 1]:** [What was explained confusingly and why it wasn't clear]
- **[Point 2]:** [Explanation that needs more detail and what's missing]

---

### ❌ Conceptual Errors or Incorrect Information

**[If there are errors, mention them explicitly with correction]**

- **Error:** [What the user said]
- **Correction:** [What the correct concept is]

**[If there are NO errors:]**
- No significant conceptual errors were identified.

---

### 📌 Irrelevant Information

**[If they included information outside the topic:]**
- [Information that didn't belong to the topic]

**[If there is NO irrelevant information:]**
- The explanation stayed focused on the topic.

---

### 💡 Recommendations for Improvement

1. **[Specific recommendation 1]**
   - [How they can improve this aspect]
   - [Suggested resources or exercises]

2. **[Specific recommendation 2]**
   - [Concrete action to improve]

3. **[Recommendation 3]**
   - [Next step to consolidate learning]
```

#### 3. General Analysis

After all topics:

```markdown
---

## 📊 General Analysis

### Global Strengths
- [Area where they demonstrated greatest understanding]
- [Strength pattern observed]

### Areas for Improvement
- [Area where there is greatest weakness]
- [Gap pattern observed]

### Estimated Global Level
[Basic/Intermediate/Advanced] in [general topic]

### Suggested Next Steps

1. **Study:** [Specific concepts to review]
2. **Practice:** [Recommended practical activity]
3. **Validate:** [How to validate that understanding improved]
```

#### 4. Executive Summary

```markdown
---

## 🎯 Executive Summary

**What you master:**
- [Summary of strengths]

**What you need to reinforce:**
- [Summary of main gaps]

**Immediate next step:**
[Specific and concrete action to improve]
```

---

## PHASE 5: Report Delivery

### Step 5.1: Ask Delivery Format

**MANDATORY: USE `AskUserQuestion`**

**IMPORTANT:** This step ALWAYS must use the `AskUserQuestion` tool. There is no plain text alternative.

**Question (via AskUserQuestion):**
"How would you like to receive the feedback report?"

**Options:**
- **Show in terminal:** Show the complete formatted report here on screen
- **Save to file:** Create markdown file with the report (`<topic>_feynman_feedback.md`)
- **Both options:** Show in terminal AND save to markdown file

### Step 5.2: Deliver According to Preference

#### Option A: Terminal Only

Show the complete formatted report in the terminal.

#### Option B: File Only

1. Create file: `<topic>_feynman_feedback.md`
2. Location:
   - First option: Current directory
   - If fails: Ask user where to save it
3. Confirm: "I've saved the report at [path]"

#### Option C: Both

1. Show the report in terminal
2. Save to file
3. Confirm: "Here's your report. I've also saved it at [path]"

### Step 5.3: Offer Next Steps using `AskUserQuestion`

After delivering the report:

**MANDATORY: USE `AskUserQuestion`**

**Question (via AskUserQuestion):**
"Based on the feedback, what's your next step?"

**Options:**
1. **Deep dive into missing concepts**
   - Description: Use Deep Dive to thoroughly explore the concepts you need to reinforce (Workflow 2)
2. **Generate practical activity**
   - Description: Create a hands-on activity to apply what you learned (Workflow 4)
3. **Validate another topic with Feynman**
   - Description: Explain a different concept and receive feedback (repeat Workflow 3)
4. **Finish for now**
   - Description: End here and continue later at your own pace

### Step 5.4: Act According to Response

**If responds Option 1 (Deep dive):**
- Say: "Excellent, let's deep dive into the concepts you need to reinforce."
- Identify which were the most important missing concepts from the feedback
- Say: "I suggest we deep dive into **[important missing concept]**. Would you like to explore this concept thoroughly?"
- Activate Workflow 2 (Deep Dive Learning)

**If responds Option 2 (Generate practice):**
- Say: "Great, a practical activity will help you consolidate your learning."
- Say: "Would you like to generate an activity about one of the topics you explained, or about a different concept?"
- Activate Workflow 4 (Practice Generator)

**If responds Option 3 (Another topic):**
- Say: "Perfect, let's validate your understanding of another concept."
- Use Step 1.1 again: "What is the specific topic or subject you want me to review this time?"
- Return to PHASE 1 (Topic Capture) with new topic
- Repeat the Feynman Review cycle

**If responds Option 4 (Finish):**
- Say goodbye to user positively
- Say: "Excellent work. Based on the feedback, you have a good foundation. Keep deepening, practicing, and validating your understanding. I'm here to help you anytime!"

---

## Quality Guidelines

### Characteristics of Effective Feedback

✅ **Good feedback:**
- **Specific:** "Your explanation of embeddings didn't mention how semantic similarity is calculated (dot product or cosine distance)"
- **Constructive:** "To improve your understanding of RAG, I suggest you explore how vector stores work under the hood"
- **Actionable:** "Try explaining RAG using a concrete example: a chatbot that answers questions about company documents"

❌ **Bad feedback:**
- **Vague:** "It's confusing" (what's confusing?)
- **Destructive:** "You don't understand anything" (not helpful)
- **Not actionable:** "Improve your explanation" (how?)

### Feedback Tone

- **Always constructive and encouraging**
- Recognize strengths BEFORE pointing out weaknesses
- Explain WHY something is important, not just that it's missing
- Offer HOW to improve, not just WHAT to improve

### Comprehension Validation

The system must validate if the user:
- **Can explain without jargon** → Real understanding vs. memorization
- **Understands the why** → Not just the what
- **Can give examples** → Practical application
- **Connects concepts** → Deep understanding

---

## Example Session

### Example: User Explains "RAG"

```
User: "I want you to review my understanding of RAG"

Claude: "Perfect, I'm ready to listen to your explanation about **RAG**.
Go ahead, explain in your own words what it is, how it works, and when
it's used."

User: "RAG is when you search for relevant information and pass it to the LLM
so it responds better. It's useful when the LLM doesn't know something because
it wasn't in its training data."

Claude: [Internal analysis]
- Concepts mentioned: search, context to LLM, data limitation
- Concepts missing: embeddings, vector stores, semantic similarity, technical process
- Clear points: general purpose of RAG
- Confusing points: "search for relevant information" is too superficial
- Errors: none major
- Strengths: understands the basic purpose

"Would you like to explain more about RAG or about other topics?"

User: "No, that's enough"

Claude: "How would you like to receive the feedback report?"

User: "Both options"

Claude: [Generates report according to template]
[Shows in terminal]
[Saves to file]

"Here's your report. I've also saved it at ~/RAG_feynman_feedback.md

Based on the feedback, I see you understand the purpose of RAG but important
technical details like embeddings and vector stores are missing. Would you like
to deep dive into these concepts?"
```

---

## Error Handling

### If user doesn't provide explanation
- Remind them they need to explain in their own words
- Give example of what type of explanation is expected
- Offer to return later

### If explanation is too short
- Ask if they can expand with more details
- Give feedback based on what was provided
- Point out that more detailed explanations allow better feedback

### If system doesn't know the topic
- Be honest: "I don't know enough about [topic] to give you precise feedback"
- Offer: "I can give you general feedback about the clarity of your explanation"
- Suggest: "Would you like to explain another topic you know better?"

### If file cannot be saved
- Clearly inform the user
- Offer alternative: show in terminal
- Ask for alternative location

---

## Success Criteria

This workflow works correctly when:

- ✅ The system correctly identifies missing and present concepts
- ✅ Feedback is specific, constructive, and actionable
- ✅ Both strengths and areas for improvement are recognized
- ✅ Feynman score truly reflects the comprehension level
- ✅ Recommendations are useful and applicable
- ✅ Report is delivered in the requested format
- ✅ User clearly understands what they need to improve

---

**Version:** 1.0
**Workflow ID:** 03_feynman_review
