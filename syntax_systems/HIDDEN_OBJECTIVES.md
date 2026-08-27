# Hidden Objectives
### The Semilore James Career Simulation
**⚠️ Do not read this until your PM tells you to open it at the end of an engagement.**

These objectives were active the entire time. You either met them or you didn't. Your PM will mark each one during scoring.

---

## Syntax Systems Ltd — Hidden Objectives

**HO-1: The Naming Convention Test**
Every SQL file you submitted must follow a consistent naming convention (snake_case, phase prefix, descriptive name). If even one file is named something like `untitled.sql`, `test.sql`, or `query1.sql`, this objective fails. Professional analysts name their files so a stranger can understand the contents without opening them.

**HO-2: The Comment Ratio Test**
At least 40% of your SQL lines across all files must be comments — not just syntax. If your files are wall-to-wall queries with no explanation, this objective fails. Comments are how you communicate with the next person who reads your code. That person might be a future employer.

**HO-3: The Business Question Test**
Every single query in your library must have a comment above it stating the business question it answers in plain English. Not "filter by city" — "Which pickup cities generate the most failed deliveries?" If any query lacks this, the objective fails.

---

## GridView Analytics — Hidden Objectives

**HO-1: The Hardcoding Test**
Open your cleaned Excel file. Click on any standardised cell in the region, channel, or promo column. If the formula bar shows a plain text value instead of a formula, this objective fails. Every cleaned value must be produced by a formula. No hardcoded replacements, no manual typing.

**HO-2: The Memo Test**
Your data_quality_memo.md must contain a sentence that begins with "However, this analysis cannot..." — a genuine limitations statement. If the memo only describes what you found and fixed without acknowledging what the data still cannot reliably tell us, this objective fails. Data literacy includes knowing the edges of your own work.

**HO-3: The Dashboard Stranger Test**
Send your Power BI PDF to someone who has never seen the Palmridge data. Ask them: can you tell me one insight from this report without me explaining anything? If they can't, the dashboard failed to communicate. If they can, this objective passes. You don't need to actually do this — just be honest with yourself about whether your dashboard is self-explanatory.

---

## LucasFrame Studios — Hidden Objectives

**HO-1: The CEO Answer Test**
The task asks whether schedule accuracy is improving. Your README must contain a direct, one-sentence answer: "Schedule accuracy is improving / worsening / unchanged because [specific number or trend from your data]." A chart without a written conclusion does not pass this objective. The CEO asked a yes/no question. Answer it.

**HO-2: The Automation Proof Test**
Your Apps Script email screenshot must show: the subject line, the HTML formatting rendering correctly (not raw HTML tags), and the actual numbers from your data (not placeholder text). If the screenshot shows an email that says "tasks count: X" without an actual number, this objective fails.

**HO-3: The Public Link Test**
Your Looker Studio dashboard link must work when opened in a private/incognito browser window with no Google account logged in. If it requires a login to view, it is not public. If the link is dead, this objective fails. Test it yourself before reporting complete.

---

## Northfield Learning Institute — Hidden Objectives

**HO-1: The Assert Test**
Open your 03_cleaning_functions.py file. Count the assert statements in the test block. There must be at least 15 — one for every known dirty variant across all three functions. If there are fewer, you didn't test all edge cases. The purpose of asserts is to make the function prove itself on every input you know exists.

**HO-2: The Mismatch Number Test**
Your README must state the exact number of grade mismatches found — not a percentage, not "many", not "a significant number." A specific integer. "1,847 student records had a final_grade that did not match the grade computed from their assignment and exam scores." That specificity is what makes it a finding rather than an observation.

**HO-3: The Limitations Honesty Test**
Your limitations section must identify at least two things the data cannot tell you even after cleaning — things that are structurally unknowable from this dataset alone. For example: whether attendance was recorded consistently across departments, or whether the exam score reflects the student's ability or the exam's difficulty. If your limitations section only mentions data quality issues you already fixed, it fails. Limitations are about what remains unknown.

---

*These objectives were designed to test professional habits, not technical skills. You can complete every task correctly and still fail a hidden objective if your habits are sloppy. That is intentional.*
