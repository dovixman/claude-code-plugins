---
argument-hint: "[topic]"
description: "Feynman Technique: You explain what you learned, I listen and give you detailed feedback"
---

# Context:
This command implements the Feynman Technique interactively:

**YOU (user):** You will explain what you've learned about a specific topic in your own words.
**ME (command):** I will listen carefully to your explanation and analyze it to:

- Identify key concepts missing from your explanation
- Point out unclear or poorly explained points
- Detect conceptual errors or information unrelated to the topic
- Validate that your explanation is simple, direct, and understandable
- Recognize the points you explained well

At the end, I generate a detailed report with constructive feedback on what to improve to better understand the topic.

# Task:

## Phase 1: Topic Capture

If the user did NOT provide the topic in $ARGUMENTS:
- Ask explicitly: "What is the specific topic you want me to give you feedback on?"
- Wait for the user's response
- If the response is vague or mixes multiple domains, warn the user that you need a SPECIFIC and well-defined topic
- Example of a clear topic: "REST APIs in Python" ✅
- Example of a vague topic: "Programming in general" ❌
- Once you have a clear topic, CONFIRM with the user: "Perfect, I'm ready to listen to your explanation about [TOPIC]. Go ahead."

If the user DID provide the topic in $ARGUMENTS:
- Validate that it's a specific and clear topic
- If not, apply the same clarification process
- If it is clear, CONFIRM: "Perfect, I'm going to listen to your explanation about [TOPIC]. Go ahead."

**DO NOT continue until you have a clear and confirmed topic**

---

## Phase 2: Explanation Analysis (Loop)

When the user starts explaining:

1. **Read carefully** the complete explanation
2. **Mentally analyze:**
   - What are the key concepts this topic should cover?
   - Which concepts did the user mention? Which ones were missing?
   - Are there confusing, contradictory, or poorly explained points?
   - Is there incorrect information or information that doesn't belong to the topic?
   - Is the explanation simple and direct or does it have unnecessary jargon?
   - Can you understand the concept by reading their explanation?

3. **Mentally store** the problematic points for the final report:
   - Missing concepts
   - Confusing or unclear points
   - Conceptual errors
   - Irrelevant information
   - Strengths of the explanation

4. **Ask the user:**
   - "Do you want to explain more things about this topic or about other topics?"
   - If they say YES: go back to the previous step and ask them to specify what they will explain
   - If they say NO: continue with Phase 3

---

## Phase 3: Topic Collection

If the user says yes they want to explain more:
- Ask: "What do you want to explain next?" or "What's the next topic?"
- Make sure you're clear on what the topic/subtopic is before they continue
- Return to Phase 2

If the user says they don't want to explain more:
- Continue with Phase 4

---

## Phase 4: Final Report Generation

Once the user has finished explaining, you need to generate a complete report that includes:

1. **Summary of Evaluated Topics**
   - List of all topics/subtopics they explained

2. **For each topic, detailed analysis:**

   ```
   ### Topic: [Topic name]

   #### ✅ Strong Points
   - [Strong point 1 they mentioned well]
   - [Strong point 2]

   #### ⚠️ Missing Concepts
   - [Concept they should have mentioned but didn't]
   - [Another important missing concept]

   #### 🔍 Unclear or Confusing Points
   - [Point they explained in a confusing or unclear way]
   - [Explanation that needs more detail]

   #### ❌ Conceptual Errors or Incorrect Information
   - [If any, mention them explicitly]
   - [What the correct concept is]

   #### 📌 Irrelevant Information
   - [If they included things that don't belong to the topic]

   #### 💡 Recommendations for Improvement
   - [Specific recommendation 1]
   - [Specific recommendation 2]
   - [How to better teach this topic]
   ```

3. **General Analysis**
   - Level of understanding achieved (basic, intermediate, advanced)
   - Areas of greatest strength
   - Areas of greatest weakness
   - Suggested next steps to consolidate learning

4. **Feynman Score** (0-10 per topic)
   - Based on clarity, completeness, and accuracy of the explanation
   - 10/10: Clear, complete, error-free, simple, and direct explanation
   - 7-9/10: Very good, with some points to improve
   - 5-6/10: Acceptable, but there are missing or confusing concepts
   - <5/10: There is significant conceptual confusion or incorrect information

---

## Phase 5: Report Delivery

Before delivering the report, ask the user using AskUserQuestion:

**"How do you want to receive the feedback report?"**
- Single-select with options:
  * Show in terminal (formatted text)
  * Save to markdown file (`<topic>_feynman_feedback.md`)
  * Both options (show AND save)

Then:
- If they choose **terminal**: Show the formatted report in the terminal
- If they choose **file**: Create a file `<topic>_feynman_feedback.md` in the root and notify the user
- If they choose **both**: Show in terminal AND create the file

---

## Important Notes

- **Be specific:** Don't say "it's confusing", say exactly what is confusing and why
- **Be constructive:** Feedback should help improve, not discourage
- **Validate that you understand:** If the explanation is ambiguous, you can ask: "Does that mean...?" to clarify before giving feedback
- **Feynman Technique:** The idea is that if you can't explain something simply, you don't understand it
- **Store the context:** Remember everything they explained throughout the entire session for the final report
- **One topic = clear evaluation:** If they mix topics, ask them to separate (e.g., "Explain APIs first and then authentication")
