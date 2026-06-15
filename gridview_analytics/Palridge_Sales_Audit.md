## **AUDIT REPORT**

**File Audited:** Palmridge\_sales\_raw  
 **Auditor:** Jimmy  
 **Date:** 15/06/2026  
 **Audit Type:** Data Quality / Spreadsheet Audit

---

### **Executive Summary**

A preliminary review of the Palmridge\_sales\_raw dataset reveals **multiple data quality issues** across nearly all columns, including formatting inconsistencies, missing values, naming convention conflicts, and structural irregularities. These issues pose a risk to reporting accuracy, downstream analysis, and business decision-making.

---

### **Findings**

#### **1\. Transaction ID**

* **Issue:** IDs appear to have no logical or sequential order  
* **Risk:** Difficulty tracing transactions, detecting duplicates, or identifying gaps  
* **Recommendation:** Sort or re-sequence IDs; establish a consistent ID format going forward

---

#### **2\. Sales Date**

* **Issue:** Three different formats detected — `01/01/2000`, `01-01-2000`, and raw serial numbers like `36892`  
* **Risk:** Date-based analysis (trends, period reports) will produce errors or incorrect groupings  
* **Recommendation:** Standardize all dates to one format (e.g. `DD/MM/YYYY`) and ensure all cells are formatted as Date, not Number or Text

---

#### **3\. Region**

* **Issue:** Inconsistent naming — mix of caps, full names, and abbreviations (e.g. "NORTH", "North", "N")  
* **Risk:** Grouping and filtering by region will split the same region into multiple entries  
* **Recommendation:** Define a standard naming convention and apply uniformly across all rows

---

#### **4\. State**

* **Issue:** Empty cells observed during random scroll  
* **Risk:** Incomplete geographic data; records cannot be properly assigned to a location  
* **Recommendation:** Identify all blank cells, investigate source records, and populate or flag as "Unknown"

---

#### **5\. Store Name**

* **Issue:** Empty cells present  
* **Risk:** Transactions cannot be attributed to a specific store  
* **Recommendation:** Cross-reference with Store Code to fill gaps; flag unresolvable blanks

---

#### **6\. Store Code**

* **Issue:** Empty cells present  
* **Risk:** Store-level reporting and reconciliation will be incomplete  
* **Recommendation:** Populate missing codes from a master store list

---

#### **7\. Product Name**

* **Issue:** Empty cells and naming convention conflict — "PR" used alongside "Palmridge" for what appear to be the same products  
* **Risk:** Product-level analysis will double-count or misclassify items  
* **Recommendation:** Establish one naming convention; use find-and-replace to standardize

---

#### **8\. Product Name vs Category (SKU Conflict)**

* **Issue:** Possible mismatch between product names and their assigned categories/SKUs  
* **Risk:** Incorrect categorization affects inventory tracking, revenue reporting, and product performance analysis  
* **Recommendation:** Cross-check each SKU against a master product list and resolve conflicts before analysis

---

#### **9\. Unit Price (Naira)**

* **Issue:** Some entries have currency unit prefix (e.g. "₦500"), others are plain digits; empty cells also present  
* **Risk:** Column cannot be used in calculations as-is; mixed types will cause formula errors  
* **Recommendation:** Strip all currency symbols, store as pure numbers, and apply currency formatting at the display level only

---

#### **10\. Total Revenue (Naira)**

* **Issue:** Same as Unit Price — mix of prefixed and unprefixed values, plus empty cells  
* **Risk:** Revenue totals will be inaccurate or uncalculable  
* **Recommendation:** Same as Unit Price — clean and standardize to numeric values

---

#### **11\. Sales Rep Name / Rep Name**

* **Issue:** Appears as two separate columns possibly capturing the same data; missing cells; inconsistent capitalization (not all names follow Title Case)  
* **Risk:** Duplicate columns create confusion; missing values mean transactions are unattributed  
* **Recommendation:** Confirm if both columns are needed; if redundant, consolidate into one; standardize to Title Case

---

#### **12\. Distributor**

* **Issue:** Capitalization inconsistencies  
* **Risk:** Same distributor may appear as multiple entries in grouping/filtering  
* **Recommendation:** Standardize to Title Case or UPPERCASE consistently

---

#### **13\. Promo Applied**

* **Issue:** Missing cells and capitalization inconsistencies  
* **Risk:** Promo analysis will be incomplete and unreliable  
* **Recommendation:** Define allowed values (e.g. "Yes" / "No" or `TRUE`/`FALSE`); fill or flag missing cells

---

#### **14\. Return Flag**

* **Issue:** Mix of binary values (0/1) and text values ("Yes"/"No"); empty cells present  
* **Risk:** Inconsistent data type prevents accurate return rate calculation  
* **Recommendation:** Standardize to one format — recommend `1`/`0` (binary) for analytical efficiency; replace all text entries and fill blanks

