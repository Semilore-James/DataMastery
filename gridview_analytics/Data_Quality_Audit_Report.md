**Data Quality Audit Report**

Sales Transaction Dataset — Cleaning & Correction Log

# **Table of Contents**

# **1\. Changes Made (Corrections Log)**

Field-by-field summary of the issues found in the raw dataset and the correction applied to each.

| Field | Issue | Correction Applied |
| :---- | :---- | :---- |
| Sale Date | 6 mixed formats (ISO, US/UK slash, dashed, named-month, Excel serial, blank) | Parsed each format individually into one clean date column; genuinely invalid dates get a 1/1/1900 placeholder, flagged DATE\_UNRESOLVED |
| Region | Randomly mismatched against State (every region label paired with all 21 states) | Rebuilt entirely from a verified Nigeria State → Geopolitical Zone reference table |
| Store Code / Store Name | Same-store pairings scrambled (one code linked to 10+ unrelated names) | Canonicalized: most frequent name assigned per code |
| Product SKU | Randomly scrambled against Product Name; \~1,656 rows missing entirely | Reassigned a single standardized SKU per product name (SKU-STD-\#\#\#) |
| Product Category | 19 spelling/case/abbreviation variants of 5 real categories | Standardized via mapping table |
| Unit Price | Currency symbols and thousands separators stored as text; some recorded as zero | Stripped formatting, converted to number; recovered from Revenue ÷ Units where possible |
| Total Revenue | Same text-formatting issue; \~19,045 blank | Recovered from Unit Price × Units Sold where possible |
| Units Sold | \~1,647 blank | Recovered from Total Revenue ÷ Unit Price where possible |
| Return Flag / Promo Applied | Inconsistent Yes/No/Y/N/True/False/1/0 formatting | Standardized to Yes/No/Unknown |
| Duplicate Transactions | 12,543 duplicate rows | Removed, keeping first occurrence |
| Transaction ID / Store Code / Store Name / SKU / State / Region / Sales Rep | Residual unrecoverable blanks | Assigned traceable placeholder IDs (e.g. GA-TXN-NULL-000482), tagged in data\_quality\_flag |

# **2\. Problems Faced (Process Notes)**

* The dataset required several passes of cleaning rather than a single locale/format fix, since multiple unrelated data quality issues were layered in the same columns (e.g. Sale Date mixed six formats at once).

* Several relationships in the raw data that initially appeared to be simple formatting inconsistencies (Region/State, Store Code/Store Name, SKU/Product Name) turned out on closer inspection to be structurally randomized — no formatting fix could resolve them, only a rebuild from a verified reference or a documented standardization convention.

* Some values that looked like calculation errors (Revenue Mismatch, Quarter Mismatch) were actually artifacts of missing data being misread as incorrect data — verifying against source before assuming an error prevented double-counting the same underlying problem as two separate findings.

* A recurring balance throughout: deciding, field by field, what could be legitimately recovered from other columns in the same row versus what required a documented placeholder versus what should simply be excluded from calculations (kept blank) to avoid silently distorting totals.

# **3\. Your Observations (Confirmed Against the Data)**

* Unit price zero for some records — confirmed, 2,984 rows initially, recoverable for 86% via Revenue ÷ Units; final unresolved after all cross-checks: 1,822 rows.

* Region/State, Store/Store Code, SKU mismatch — confirmed as structural randomization, not simple typos; addressed via reference tables and canonicalization respectively.

* SKU missing, custom SKU created — 1,656 rows, standardized SKU assigned per product name.

* Total Revenue mismatch — confirmed 39,422 rows initially flagged, but 24,975 of those were rows with missing data being misread as calculation errors rather than genuine miscalculations; true calculation-only errors: 14,447 rows.

* Quarter mismatch — same root cause as Revenue: 29,900 initially flagged, largely explained by missing dates rather than genuine mismatches; resolved by deriving Quarter directly from the cleaned date going forward, removing the possibility of future mismatch.

* Product category mismatch — confirmed 19 inconsistent variants across the 5 real categories.

* Blank accounts not tracked — 1,656 rows with completely missing product identity (tagged INF), representing ₦337,974,601 in recorded revenue with no product attached; spread evenly across all reps, regions, and channels rather than concentrated in one source.

* Units sold / Unit price incorrect — confirmed, addressed via the cross-recovery formulas above.

# **4\. Placeholder Codes by Column**

Every row-numbered placeholder is traceable: \#\#\#\#\#\# is not random — it's that row's exact position in the original raw file (row 482 → ...-000482).

| Code Pattern | Column | What It Means |
| :---- | :---- | :---- |
| GA-TXN-NULL-\#\#\#\#\#\# | transaction\_id | The original transaction ID was blank in the raw data |
| GA-STR-\<state\>-\#\#\#\#\#\# | store\_code | Store code was blank; \<state\> is the first 3 letters of that row's state (e.g. LAG for Lagos) |
| GA-STR-UNK-\#\#\#\#\#\# | store\_code | Store code was blank and state was also blank, so no state abbreviation was available |
| GA-STORE-\<region\>-\<state\>-\#\#\#\#\#\# | store\_name | Store name was blank; \<region\> is built from the region's initials (e.g. South-West → SW), \<state\> is the full state name |
| GA-STORE-UNK-UNK-\#\#\#\#\#\# | store\_name | Store name was blank and both region and state were unavailable |
| GA-SKU-NULL-\#\#\#\#\#\# | product\_sku | No SKU could be assigned — happens when product\_name itself was "INF" (no product to assign a SKU to) |
| GA-STATE-NULL-\#\#\#\#\#\# | state | State was blank in the raw data |
| GA-REGION-NULL-\#\#\#\#\#\# | region | Region couldn't be derived — only happens when state was also blank, since region is built entirely from state |
| GA-REP-NULL-\#\#\#\#\#\# | sales\_rep\_id | Both sales rep ID and name were blank, with nothing in the rep dictionary to recover either from |

# **5\. Placeholder Values (Not Row-Numbered)**

| Value | Column | What It Means |
| :---- | :---- | :---- |
| INF | product\_name | Product name was blank — stands for "Item Not Found" |
| INF | product\_category | Both product name and category were blank on that row (the rare double-gap case) |
| Uncategorized | product\_category | Category was blank, but the product name itself was known — different from INF, since the product's identity isn't in question, only its category |
| Unknown | return\_flag / promo\_applied | The original value didn't match any recognized Yes/No pattern (not blank — genuinely unreadable, e.g. an "R") |
| 1/1/1900 | sale\_date | The date was blank or fundamentally invalid (e.g. a month greater than 12\) and couldn't be parsed — an obviously fake date so it's unmistakable in any chart |
| GA-QTR-NULL | quarter | Quarter couldn't be calculated because the date itself is unresolved |
| (genuinely blank) | unit\_price\_naira, units\_sold, total\_revenue\_naira | Deliberately left empty rather than placeholder-filled, since a fake number in a currency/quantity column would corrupt sums — tracked instead via the flag column |

# **6\. data\_quality\_flag Column — Tags and Their Meaning**

This column reads "Clean" for a row with no issues, or a semicolon-separated list of every problem that applied to that row.

| Flag | Meaning |
| :---- | :---- |
| TXN\_ID\_MISSING | Transaction ID was placeholder-filled |
| DATE\_UNRESOLVED | Sale date is the 1/1/1900 placeholder |
| STORE\_CODE\_MISSING | Store code was placeholder-filled |
| STORE\_NAME\_MISSING | Store name was placeholder-filled |
| STATE\_MISSING | State was placeholder-filled |
| REGION\_MISSING | Region was placeholder-filled |
| SKU\_MISSING | SKU was placeholder-filled |
| PRODUCT\_NAME\_MISSING | Product name is "INF" |
| CATEGORY\_MISSING | Category is "Uncategorized" or "INF" |
| PRICE\_UNRESOLVED | Unit price is genuinely blank/zero and unrecoverable |
| UNITS\_UNRESOLVED | Units sold is genuinely blank and unrecoverable |
| REVENUE\_UNRESOLVED | Total revenue is genuinely blank and unrecoverable |
| REP\_MISSING | Sales rep ID was placeholder-filled |

