# The Career Simulation — Complete Field Guide
**For:** Semilore James  
**Version:** 2.0 — Updated June 2026  
**Written by:** Your Project Manager  

---

## Part 1 — What This Is

You are simulating employment at four companies simultaneously. Each company has hired you for a specific role. Each role targets a specific skillset you are actively building. The work is real. The companies are not.

The goal is simple: by the time this simulation ends, you have a GitHub full of real work, a Notion log full of real progress, and a portfolio site full of real proof. Not certificates. Not course completions. Proof that you built things.

---

## Part 2 — Your Four Roles

| Company | Your Role | Skill | Dataset |
|---|---|---|---|
| Syntax Systems Ltd | Junior Data Analyst | SQL (Baraa curriculum) | swifthual_NG_raw.csv — 100k rows |
| GridView Analytics | BI Reporting Analyst | Excel + Power BI | palmridge_sales_raw.csv — 150k rows |
| LucasFrame Studios | Production Data Coordinator | Google Sheets + Looker Studio | lucasframe_production_raw.csv — 120k rows |
| Northfield Learning Institute | Research Computing Intern | Python (MIT 6.0001) | northfield_students_raw.csv — 200k rows |

---

## Part 3 — Where to Start Right Now

You do not need to work all four companies every day. Here is the order of priority based on where you are in your learning:

**Week 1–2: Syntax Systems only.**  
You are currently in DDL. The first five tasks at Syntax Systems map directly to what you are studying right now. Start there. Do not touch the other boards until you have submitted at least two tasks to your PM.

**Week 3 onwards: Add one more company.**  
Once Syntax Systems has a rhythm, open GridView. You already know Excel. The first task (Palmridge audit) is immediately within reach.

**When Northfield opens up:**  
Northfield tasks are locked to your MIT 6.0001 progress. Check the MIT Topic field on each task. If the lecture listed hasn't happened yet in your course, the task is not ready. Come back to it when it is.

**LucasFrame:**  
Google Sheets and Looker Studio. This is the most self-contained company. You can work on it in parallel with anything else whenever you want a break from SQL or Python.

---

## Part 4 — The Daily Routine

### Before You Start (2 minutes)
1. Open this guide and read your log from yesterday
2. Open your Notion board for the company you're working today
3. Find the task marked **In Progress** — if there isn't one, find the first **To Do**
4. Read: Task Name, Deliverable, PM Feedback
5. Open your SQL tool / Excel / Google Sheets / Python editor

### During Work
- Build the actual thing. Not notes about the thing. The thing.
- If you get stuck, read the PM Feedback note again — it usually tells you what to look up
- If you are stuck for more than 20 minutes, note the specific blocker and move on. Report it to PM.

### When You Finish (5 minutes)
1. Save your file
2. Push to GitHub with a descriptive commit message (not "update" — something like "phase2: add HAVING filter for driver performance report")
3. Change the task status on Notion to **Done**
4. Write your daily log (see Part 5)
5. Come back to Claude and report in

---

## Part 5 — The Daily Log

Your daily log lives on Notion. There is a page called **Daily Work Log** in your hub. Every working day gets one entry. Here is the format:

```
## [Date] — [Company you worked on]

**Task completed / worked on:**
[Task name from Notion]

**What I actually did:**
[2–4 sentences. What did you build? What decisions did you make?]

**Time spent:**
[Honest estimate. 30 mins, 2 hours, etc.]

**What I found hard:**
[Be specific. "The HAVING clause" not "SQL was hard."]

**What I want to do tomorrow:**
[Specific task or specific concept to study]

**GitHub link:**
[Direct link to the file or commit]

**X post drafted:**
[Your post for today — see Part 6]
```

This log is what your PM reads when you check in. The more specific it is, the better the feedback you get back.

---

## Part 6 — Your Daily X Post

Every working day, you post once on X. This is not optional. The simulation only builds your portfolio if people can see you building it. Consistent public output is what separates analysts who get noticed from those who don't.

### What Companies Look For (vs What Recruiters Look For)

**Recruiters on X** want to see: enthusiasm, consistency, learning in public, soft skills proof.  
**Hiring managers and data teams** want to see: specific technical detail, real problems solved, honest reflection on difficulty.

Your posts must appeal to both. Here is how.

### The X Post Formula

Every post should contain three things:
1. **What you built** — specific, not vague
2. **What was hard about it** — honest, not performative
3. **What it means** — why does this skill matter in a real job

### Post Templates by Day Type

**Task completion day:**
```
Built [specific thing] today for a fictional [company type] client.

[One specific technical detail — e.g. "Used LAG() to calculate days between 
consecutive orders — this is how you detect churn patterns without needing 
a separate calculation table"]

Hardest part: [specific honest struggle]

[Relevant hashtags: #DataAnalytics #SQL #LearningInPublic #TechTwitter #DataNigeria]
```

**Struggle day (something took longer than expected):**
```
Spent [time] today figuring out why my [query/formula/script] was returning 
[wrong result].

Turned out: [root cause in one sentence]

The fix: [what you actually changed]

Lesson: [what this means going forward]

#[relevant tags]
```

**Insight day (you noticed something interesting in the data):**
```
Found something in the [company type] dataset today:

[Specific finding — e.g. "17% of deliveries marked 'Delivered' have a NULL 
delivery date. That's a data integrity problem that would break any date-based 
performance report."]

This is why data audits exist before dashboards.

#DataAnalytics #[skill] #LearningInPublic
```

**Portfolio day (you finished something portfolio-ready):**
```
Finished [project name]. Here's what it includes:

→ [deliverable 1]
→ [deliverable 2]  
→ [deliverable 3]

The dataset: [brief description, row count]
The tool: [SQL / Excel / Power BI / Python]
GitHub: [link]

[1–2 sentence finding from the data]

#DataPortfolio #[skill] #OpenToWork
```

### What NOT to Post
- Vague inspiration ("Every day is a chance to learn 🚀")
- Completion without detail ("Just finished a SQL project!")
- Fake enthusiasm you don't feel
- Screenshots of someone else's work

### Posting Schedule
- Minimum 4 posts per week (aim for 5 on working days)
- Never miss more than 2 consecutive days
- Reply to at least one other learning-in-public post per week

---

## Part 7 — How to Report to Your PM

After every session, come to Claude and say what you did. Format:

> "Done with [task name]. Here's what I built: [brief description]. Struggled with [specific thing]. GitHub: [link]."

Your PM will:
- Mark the task as **Logged** on Notion
- Give you specific feedback on what you submitted
- Assign or confirm your next task
- Flag if you're ahead/behind where you should be on your curriculum

If you're stuck:
> "Stuck on [task name]. I tried [what you tried]. It failed because [what happened]. I don't understand [specific concept]."

Your PM will give you a specific resource and a simplified version of the task if needed.

---

## Part 8 — The Status System

| Status | Meaning |
|---|---|
| **To Do** | Assigned. Not started. |
| **In Progress** | You are actively working on this right now. Only one task per company should be In Progress at a time. |
| **Done** | Deliverable exists and is on GitHub. |
| **Logged** | PM has reviewed it and recorded it. You can move on. |
| **Blocked** | You hit something you haven't learned yet. PM has been notified. |

Never mark **Done** until the file exists on GitHub. Understanding something is not Done. Building something is Done.

---

## Part 9 — Scoring

At the end of each company engagement, your PM runs a score review. This involves:
1. Reading your GitHub repo for every submitted file
2. Checking Notion for your task completion history and daily logs
3. Scoring 8 dimensions out of 10 each (total: /80)
4. Writing a written PM assessment
5. Revealing hidden objectives and marking whether you met them

The score sheet for each company is on your Notion hub. Your PM fills it in — you do not.

Grades:
- **72–80 / Distinction** — Client-ready work. Put it front and centre on your portfolio.
- **60–71 / Merit** — Strong work with minor gaps. Brief the gaps in your README.
- **48–59 / Pass** — Competent. Some tasks need revisiting.
- **Below 48 / Refer** — Specific tasks must be redone before the engagement closes.

---

## Part 10 — Hidden Objectives

Each company has three hidden objectives active from day one. You do not know what they are until your PM reveals them at scoring.

They are not technical challenges. They test professional habits — things like whether you named your files properly, whether your documentation is honest about limitations, whether your deliverables are self-explanatory to a stranger.

The hidden objectives file has been given to you. **Do not open it until your PM tells you to.**

---

## Part 11 — Portfolio Integration

Your portfolio site is **semilore-james.github.io**. Every task marked **Portfolio Ready** should eventually have a link from there.

What belongs on the portfolio:
- The final project from each company engagement (project_001 through project_004)
- Dashboard screenshots (even static images of live dashboards)
- GitHub repo links with readable READMEs
- The data quality memo from GridView
- The error log from Northfield (yes, really — it shows rigour)

What to write in each portfolio project description:
1. What the dataset was and where it came from (fictional but realistic)
2. What problem you were solving
3. What you built
4. What you found — a specific finding, not a generic summary
5. What you'd do differently next time

That last point is the one most people skip. It's also the one that makes senior analysts take you seriously.

---

## Part 12 — Tools You Need

| Task | Tool | Where to Get It |
|---|---|---|
| SQL | DB Browser for SQLite | sqlitebrowser.org |
| SQL (alternative) | DBeaver Community | dbeaver.io |
| Python | Python 3.x | python.org |
| Python editor | VS Code | code.visualstudio.com |
| Excel | Microsoft Excel or LibreOffice Calc | office.com / libreoffice.org |
| Power BI | Power BI Desktop | microsoft.com/power-bi |
| Google Sheets | Any Google account | sheets.google.com |
| Looker Studio | Any Google account | lookerstudio.google.com |
| Version control | Git + GitHub | github.com |

---

## Part 13 — When You Are Stuck

**"I don't know where to start on this task."**  
Read the PM Feedback field in full. The last sentence usually tells you the specific concept to search. Search: "[concept] tutorial [your SQL flavour / Python / Excel]".

**"I searched for 2 hours and still don't understand."**  
Tell your PM. Describe what you searched, what you read, and what specifically you still don't understand. You'll get a targeted explanation and a simpler entry point.

**"The task is too hard for where I am in my learning."**  
This is what the **Blocked** status is for. Mark it Blocked. Tell your PM which concept you haven't reached yet. The task will be there when you get there.

**"I finished faster than expected and want more."**  
Tell your PM what you completed and ask for the next assignment. You'll get it immediately.

**"I haven't worked in a week."**  
Come back. No explanation needed. Just pick up the next In Progress task and report in. The simulation doesn't end because you missed days. It ends when you decide to end it.

---

## Part 14 — Free Data Sources (for future tasks)

- **Kaggle Datasets** — kaggle.com/datasets — search any industry
- **data.gov.ng** — Nigerian government open data
- **World Bank Open Data** — data.worldbank.org
- **FRED** — fred.stlouisfed.org — economic time series
- **Nigerian Exchange Group** — ngxgroup.com — market and company data
- **NIMET** — nimet.gov.ng — Nigerian meteorological data

---

*This guide is a living document. Your PM will update it as the simulation evolves. Check back at the start of each new company engagement.*
