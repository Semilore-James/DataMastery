# Northfield Learning Institute — Python Curriculum Redesign
**Replaces:** MIT 6.0001 as the curriculum spine
**Reason:** 6.0001 is a CS1 course — it teaches programming to future software engineers (recursion, Newton-Raphson approximation, OOP class design as a dedicated unit). It was never a "Python for data analysis" course, and pandas isn't native 6.0001 content at all. The old board was bolting "now use pandas" onto lecture labels that don't teach it. This spine replaces that with the actual sequence a working data analyst learns Python in.
**Domain/narrative:** Unchanged. Northfield stays the fictional university, the grade-integrity investigation stays the spine story, `exam_board_scores.csv` and `modules.csv` stay in play.

---

## Why this specific order

A data analyst's Python is learned in service of a dataset, not in service of computer science. You don't need recursion to clean 200,000 student records. You do need to know cold: how to load and inspect data, how to clean it without a loop-per-column, how to combine two files that describe the same thing differently (`exam_score` vs `official_exam_score`), how to summarize and visualize it, and — because you're aiming at product/analytics-style roles — how to say whether a difference in the data is real or noise. That last one (basic statistics) never appears in 6.0001 at all, and it's the thing that separates "I found a number" from "I found a finding."

---

## Phase 0 — Python Foundations for Data Work
**Skills:** variables, types, control flow, functions, lists/dicts — taught against real Northfield rows from day one, not toy problems.
**Why it stays:** you can't skip fundamentals, but they don't need a dedicated abstract unit — every exercise here should already touch `northfield_students_raw.csv`.
**Existing task that fits:** the current Task 1 ("basic first look" using only the `csv` module) is actually a good Phase 0 anchor — doing it the hard way once, before pandas, is what makes Phase 1 land. Keep it, keep it first.

## Phase 1 — Pandas Fundamentals
**Skills:** `pd.read_csv`, DataFrame vs Series, `.dtypes`, indexing/selecting (`.loc`/`.iloc`), boolean filtering, `.describe()`, `.value_counts()`.
**New anchor task needed:** nothing currently formally introduces the DataFrame itself — the board jumps from raw-csv-module straight to "write cleaning functions." Add one short task: load the file with pandas, produce a column-by-column profile (dtype, null count, unique count, min/max where numeric) — this replaces the existing "null count per column" task (Lecture 2) and folds it in properly as a pandas exercise instead of a manual loop.
**Existing task that fits:** "academic registry wants an exploratory summary of the clean data" belongs here too, once cleaning (Phase 2) is done.

## Phase 2 — Data Cleaning at Scale
**Skills:** vectorized string cleaning (`.str.upper()`, `.str.strip()`, regex via `.str.extract`), handling missing data (`.fillna`, `.dropna`, deciding which), dtype coercion, writing cleaning logic as **reusable functions**, not copy-pasted per column.
**Existing tasks that fit directly:** "Gender has 13 variants" (functions), "age values of 0/-1/999" (outlier handling), "single script full pipeline" (the capstone-of-cleaning). All three keep their content — they just move under a pandas-native implementation instead of manual `csv`-module loops.

## Phase 3 — Reshaping & Combining
**Skills:** `merge` (inner/left/outer — same conceptual ground as SQL JOINs you already know from Syntax Systems, which is worth saying out loud to you: this phase is where the two tracks connect), `concat`, `pivot_table`, `melt`.
**Anchor task:** the grade-integrity investigation already lives here — merging `exam_board_scores.csv` onto the main records by `student_id` + `module_code` is a real-world `merge`, and `modules.csv` gives you a second join for the department rollup. No new task needed; this is where the existing (upgraded) Task 07 belongs.

## Phase 4 — Aggregation & Groupby
**Skills:** `.groupby()`, multi-key aggregation, `.agg()` with multiple functions, pivot-style summary tables.
**Existing tasks that fit:** "DVC's office has four questions about the student body," the department/programme/supervisor breakdowns inside the grade-integrity task.

## Phase 5 — Visualization
**Skills:** matplotlib/seaborn, choosing the right chart for the question, labeling for a non-technical audience (the existing hidden-objective standard — self-explanatory to a stranger — should carry over here from GridView's dashboard bar).
**Existing task that fits:** "five publication-quality charts for the faculty meeting" — unchanged in spirit, now explicitly scoped to matplotlib/seaborn instead of left vague.

## Phase 6 — Intro Statistics & Experimentation *(new phase — did not exist before)*
**Skills:** distributions, confidence intervals, a two-sample test (t-test or chi-square depending on the variable), and the discipline of asking "is this real or noise" before calling something a finding.
**Why this belongs here and didn't before:** this is the single most relevant Python-adjacent skill for the kind of company you're aiming at (PostHog-style product analytics runs on exactly this — is this A/B test result real?). It was completely absent from the MIT spine.
**New task:** "The academic integrity committee won't act on a raw count. Before this goes to them, is the grade-mismatch rate significantly different from what you'd expect by chance, or could it just be noise at this sample size?" — run the test, state a confidence interval, write the conclusion in plain English. This is the natural statistical sequel to the grade-integrity investigation, not a bolted-on exercise.

## Phase 7 — Code Quality: Testing, Errors, Minimal OOP
**Skills:** `assert`-based tests, `try/except` for graceful failure, **one** small class (not a dedicated unit) for something genuinely reusable — e.g., a `NorthfieldPipeline` object that wraps load → clean → merge → aggregate as callable steps.
**Existing tasks that fit:** "pipeline crashed on a newer export" (error handling), "software team needs a proper Python data model" (OOP) — kept, but OOP is scoped down from "learn OOP" to "use OOP once, where it earns its place," matching how much OOP an analyst actually writes day to day.

## Phase 8 — Capstone / Portfolio Project
**Unchanged in spirit.** Full pipeline, findings stated with exact numbers, a written limitations section identifying what's structurally unknowable — the existing hidden-objective bar here was already good and should carry over as-is.

---

## What this drops from the old spine, and why that's fine
- **Recursion** — real, but not something a working analyst reaches for. Cut.
- **Approximation methods (Newton-Raphson, bisection search)** — CS-fundamentals content, zero relevance to data work. Cut.
- **A dedicated OOP unit** — kept, shrunk to one applied use, not a topic studied for its own sake.

## Net task-board impact
Most existing Northfield tasks survive and just get re-slotted under the phase that actually matches what they ask you to do — the content was mostly fine, the sequencing and framing (pandas bolted onto non-pandas lecture labels) was the problem. Two genuinely new tasks: the Phase 1 pandas-profiling anchor, and the Phase 6 significance-testing task. I haven't touched Notion yet — this file is the plan for review.
