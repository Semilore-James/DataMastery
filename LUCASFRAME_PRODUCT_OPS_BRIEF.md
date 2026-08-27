# LucasFrame Studios — Product & Operations Management Redesign
**Replaces:** the Sheets/Looker Studio "audit → clean → pivot → dashboard" arc, which was structurally a repeat of GridView's Excel/Power BI arc with different menus.
**New role:** Production Data Coordinator → **Product & Operations Analyst**
**New skills in scope:** Product Management (you have never done this — this file explains what it is before it asks you to do it) and Operations Management (largely already present in the existing engagement, now named and structured as its own discipline instead of hiding inside "Google Sheets" as a skill tag).

---

## Part 1 — What Product Management actually is, since you haven't done it

Product Management is the discipline of deciding **what gets built and why**, under limited time and money, and being accountable for the *outcome* (did it actually help), not just the *output* (did it ship). A PM doesn't write the code and usually doesn't run the day-to-day operations either — a PM's job is to turn a messy, real problem into something a team can actually go build, and then prove afterward that it worked.

There are seven things a PM does. Every phase below maps to one of them:

1. **Discovery** — figuring out what the real problem is, from the people who have it. Not guessing.
2. **Strategy** — deciding what "good" looks like and why this problem is worth solving now.
3. **Prioritization** — you always have more good ideas than time. Choosing what NOT to build is the actual skill.
4. **Definition** — writing down precisely enough what's being built that an engineer, a designer, or in this case an ops team, can act on it without you in the room. This is the PRD (Product Requirements Document).
5. **Execution** — working the plan: unblocking people, tracking progress, making trade-off calls when reality doesn't match the plan.
6. **Measurement** — defining up front how you'll know if it worked, then actually checking.
7. **Communication** — every one of the above is worthless if the CEO, the ops team, and the users don't understand what you decided and why.

**Operations Management is a different, related discipline:** it's about how the *work itself* flows — process design, resource allocation (people, budget, vendors), risk management, and continuous improvement (post-mortems, SOPs). LucasFrame's existing engagement was already teaching you real ops management (schedule tracking, budget variance, vendor reconciliation) — it just never told you that's what it was. This redesign names it.

**Why both, together, at LucasFrame specifically:** the two disciplines meet exactly where a real company's internal tooling gets built. LucasFrame's ops problem (nobody trusts the production data, budgets slip, schedules slip) *is* a product opportunity — someone has to decide whether building a tool is worth it, what it should do first, and whether it actually helped once it exists. That someone is you, for this engagement.

---

## Part 2 — The new narrative

LucasFrame's Head of Production has been pushing the same complaint for two quarters: nobody trusts the production data, and every report is manually rebuilt from scratch. The CEO has agreed to fund a small internal tool — internally called **ProdOS** — and has asked for someone to own it end to end: figure out what it should actually do, write it up properly, and prove afterward whether it worked. That's you.

A second character joins the cast: **the Head of Product** (new — gives you a PM-specific stakeholder distinct from the Head of Production, so discovery interviews and prioritization debates have someone real to be *for* and *against*). The Head of Production still owns the operational data work (budget, schedule, vendors) exactly as before.

---

## Part 3 — Phase Breakdown

### Phase 1 — Operations Foundation *(existing, unchanged)*
Audit and clean the production tracking data. This is the existing Phase 1/2 work (name-spelling cleanup, status/priority standardization, the audit tab). No changes — this is real ops-analyst work and stays as-is.

### Phase 2 — Operations Analysis *(existing, unchanged)*
Budget utilisation, schedule accuracy trend, the vendor invoice reconciliation task already added. This is the ops-management half of the engagement and it was already good — it's just now explicitly labeled Operations Management rather than buried under "Google Sheets" as a skill tag.

### Phase 3 — Product Discovery *(new)*
**Skill:** synthesizing scattered, sometimes-contradictory stakeholder input into a single problem statement — the single most-repeated first step of real PM work.
**Deliverable:** you'll be given a handful of synthetic stakeholder quotes (Head of Production, two production coordinators, a director, finance) describing the same underlying pain from different angles — some will conflict. Write a one-page **Opportunity Assessment**: what's the actual problem (not the first thing anyone said — the thing underneath it), who has it worst, and what happens if nothing changes.
**Why this matters for you specifically:** every PM job posting asks for "customer discovery" experience. This is the artifact that proves you can do it without having sat in a real stakeholder's office yet.

### Phase 4 — Product Definition *(new)*
**Skills:** writing a PRD, defining user personas, prioritization frameworks (RICE — Reach, Impact, Confidence, Effort), scoping a v1 that's small enough to actually ship.
**Deliverables:**
- A **PRD for ProdOS v1**: problem statement, goals, explicit non-goals (what you're deliberately NOT building yet — this is the part beginners skip and seniors don't), 3 user personas (Production Coordinator, Head of Production, Finance), user stories with acceptance criteria per persona.
- A **RICE-scored feature backlog** — you'll be handed 10-12 candidate features (some obviously good, some obviously scope creep, a couple genuinely ambiguous) and have to score and rank them, then draw the Now/Next/Later line and defend it in writing.
- A **flow sketch** in Excalidraw (or Miro, once you've authorized that connector) — this is the one deliverable in this engagement that isn't a spreadsheet, and it's not decorative: a PM who can't sketch how a user actually moves through a tool hasn't actually thought it through yet.

### Phase 5 — Product Execution & Measurement *(new — reuses your existing Sheets/Looker skill, redirected)*
**Skills:** defining success metrics *before* launch (not after), building a metrics dashboard, running a rollout, writing a post-launch review.
**Deliverables:**
- A short **metrics definition doc**: what does "ProdOS is working" actually mean, numerically — e.g., % of active projects with a same-day-updated status, adoption rate among coordinators in week 1 vs week 4, time-to-find-a-number (a real UX metric). Vague success criteria is a specific, common, callable-out PM failure — this task is designed to make that mistake visible if you make it, the same way GridView's hidden objectives caught hardcoded formulas.
- A **Looker Studio dashboard tracking those metrics** against a synthetic usage dataset (generated once you're ready for this phase). This is genuinely different from GridView's dashboard task even though the tool is the same: GridView's dashboard reports on the *business*; this one reports on whether *your own product decision* worked. That's product analytics, not BI reporting, and companies distinguish between the two roles for a reason.
- A **rollout plan** — this is the ops-management half re-entering: how do you introduce a new tool across production teams mid-shoot without breaking anything currently running. Training plan, phased rollout order, rollback criteria if adoption stalls.
- A **post-launch retro**: what worked, what didn't, what you'd cut from v1 if you were starting over. Honest retros are rarer than they should be — this is one of the hidden-objective-style habits worth carrying over from the other three companies.

### Phase 6 — Portfolio Capstone
One polished case study combining the Opportunity Assessment, PRD, roadmap, flow sketch, metrics dashboard, and retro into a single narrative document — "here's a real product decision I made, here's how I measured whether it worked, here's what I'd do differently." This is the actual differentiator: almost nobody making your transition has a PM artifact that looks like this, because almost nobody makes themselves write the retro.

---

## Part 4 — What's genuinely new here vs. what's just relabeled

| Old LucasFrame | New LucasFrame |
|---|---|
| Sheets/Looker as a second BI toolset, same loop as GridView | Sheets/Looker redirected toward product analytics, a different discipline than BI reporting |
| "Production Data Coordinator" | "Product & Operations Analyst" — two named disciplines, not one |
| No PM content at all | Discovery → Definition → Execution → Measurement, the actual PM loop, done once, end to end |
| Diagram tools mentioned as an idea, not used | Excalidraw flow sketch is a required deliverable, not decoration |

Nothing here has been pushed into Notion yet — this file is the plan for you to react to before I touch the task board.
