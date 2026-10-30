Build me a custom interactive quiz tool as a single self-contained HTML artifact for [Terraform], at [Advanced]. Include 50 multiple-choice questions split into 2 parts (with tabs to switch between parts).
Along with web search for advanced topics, also can refer the C:\Users\A\OneDrive\Desktop\Knowledge Base\Terraform\docs\advanced-topics\TERRAFORM_ADVANCED_TOPICS.md file as well.

The tool needs these exact features:

1. Navigation & Jump Grid:
   - A grid of question-number buttons so I can click any question to jump directly to it — never just sequential Back/Next.
   - Color-code the grid buttons dynamically by status (Unanswered / Correct / Incorrect).

2. Filtering & Focused Review:
   - A "Show only incorrect" filter toggle that lets me step through and view only the questions I got wrong.

3. State Persistence & Live Tracking:
   - Save all progress (selected answers, correct/incorrect statuses) automatically in local storage so nothing is lost on accidental clicks, page reloads, or coming back later.
   - A live score bar displaying real-time counts for correct, incorrect, and unanswered questions.

4. Results & Reset Capabilities:
   - A "Submit" button on the last question of each part that opens a results modal displaying score percentages, breakdown stats, and a one-click "Review N incorrect answers" button.
   - A "Reset part" option to clear progress and retake a part from scratch.

5. Answer Formatting & Distribution:
   - Each question must show 4 options, immediately reveal the correct answer upon selection, and use clear correct/incorrect visual styling.
   - Randomize/vary the position of the correct answer evenly across all 4 option positions (A, B, C, D) to avoid guessable patterns.

6. Theme mode:
   - Dark or light theme should be given. 
   - Difficulty level should be clearly shown in the top. should be catchy.
   - Review mode & exam mode with timer would be an added advantage.

7. In-Depth Explanations & Direct Documentation Links:
   - Provide comprehensive explanations for each question: explain the underlying concept, detail why the distractor options are incorrect or how they differ, and mention real-world usage or common pitfalls.
   - Include a direct reference link to the official documentation page covering that specific question's topic (not a generic homepage link).