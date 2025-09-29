# SQL Homework Review – Day 3 (Chinook)

**Student:** Priya  
**Assignment:** MySQL Homework–3 (Day 3, Chinook)  
**Score:** 9.5 / 10  
**Reference:** Grading style inspired by [GRADED HW-4] Olagoke Day Assignment  

---

## Summary

- Clean and organized submission covering all prompts.  
- **Minor correctness issues:**  
  - Q7: Total range filter (corrected to match prompt).  
  - Q21: LastName second character pattern (corrected).  
- **Style suggestions:** Be explicit with `ASC` in `ORDER BY` and avoid extra/unrelated `SELECT`s.  
- Full corrected solution included below.

---

## Highlights

### Reading Data
- Display all invoices; show customer names and phone numbers.

### Derived & Aliased Columns
- Concatenate names (`CustomerName`) and rename `Total` as `InvoiceAmount`.

### DISTINCT
- List unique billing countries.

### Filtering (`WHERE`)
- Filter customers/invoices by country, totals, or combined conditions.

### Sorting (`ORDER BY`)
- Sort invoices by date and customers by city + first name.

### IN / NOT IN
- Select customers from specified countries or exclude them.

### Range Filters (`BETWEEN`)
- Filter totals and invoice dates within ranges.

### NULL Handling
- Find customers with/without company names.

### Pattern Matching (`LIKE`)
- Filter by starting letters, substrings, endings, or specific character positions.

---

## Fixed Solution

Full corrected SQL queries are provided in the submission for copy/paste execution. All aliases, ordering, and filters are explicit and consistent.

---

**Instructor Notes:** Excellent work overall. Minor corrections applied; demonstrates strong understanding of SQL fundamentals.
