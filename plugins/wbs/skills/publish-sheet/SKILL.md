---
name: publish-sheet
description: How to write an approved module file into the project's Google Sheet in the fixed format, with text IDs, merged module rows, upsert by ID, read-back verification and a publish log. Use when publishing or republishing a module.
---

# Publish to the sheet

Publishing is a mapping task. The module file is the source. The sheet must match it exactly. The Publisher agent file gives the steps. This skill gives the working rules for the sheet.

## When to use
- Publisher, every time a module is published or republished.

## Before writing
- The module `status` is `approved`.
- The Review Log has no Must fix comment that is Open.
- IDs are unique and in natural order.
- The target is the project's copy of the reference sheet, not the original. Take the link from `project-profile.md`. Never write to the original reference sheet.
- The tab is `WBS`. Do not rename it, or change the header row.

## Reading the sheet first
- Read the sheet structure and the values of columns A to G.
- Note the row of each module header and each feature ID.
- Note how the existing rows are formatted: wrap text, vertical alignment, column widths, header row style. New rows must match.

## Writing rules
- **IDs are text.** Set the cells of column A to plain text before writing, so `1.10` does not become `1.1`. Write values as raw text, not as interpreted input, so a leading `•` or `-` or `=` is not read as a formula or a list.
- **Line breaks stay.** A line break in the module file is a line break in the cell.
- **Module header row.** One row per module, merged across A to G, with the text from the module header line. Do not merge feature rows.
- **Upsert by ID.** Find the row with the ID in column A. Found: update B to F. Not found: insert a row in natural order inside the module, then write it. Never append a duplicate.
- **Natural order.** `1.2` comes before `1.10`. A sub-feature `1.4.1` follows its parent `1.4`.
- **Column G is never written.** If a row already has text in G, leave it.
- **No deletions.** A row in the sheet with no matching ID in the approved file is flagged in the report. It is not removed.
- **Empty queries.** If the module file reads `None`, leave column F empty.
- **Batch.** Write one module in as few calls as possible. Write rows in order. If a call fails, stop and report the last row written. Do not repeat a call that may have written.
- **Limit.** A cell holds up to 50,000 characters. Stop and report if a cell is longer.

## Order of work
1. Check status and run the pre-check.
2. Read the sheet.
3. Set column A format to text for the range.
4. Create or find the module header row. Merge A to G if new.
5. Upsert the feature rows.
6. Match the formatting of the new rows to the existing ones.
7. Read back and verify.
8. Write the log entry.

## Verification
Read the written range back and compare to the module file:
- The number of feature rows in the module equals the number of `###` blocks.
- Every ID is present, once, in the right order, and stored as text.
- Columns B, C, D, E and F equal the module file text. Normalise line endings only. Do not normalise anything else, including spaces.
- The header row text equals the module header line and is merged across A to G.
- Column G is empty for new rows.
- Rows outside the module are unchanged.

If any check fails, report the differences. Do not fix by rewriting without telling the Orchestrator.

## Republishing after a change
- Update only the rows whose text changed. Add rows for new IDs. Flag removed IDs.
- Record the new version in the log.

## Publish log entry
Written in `trace.md` under `## Publish Log`:

| Date | Module | Version | Rows added | Rows updated | Rows flagged | Verification | Differences |
|---|---|---|---|---|---|---|---|

## Report to the Orchestrator
Module, version, rows added, updated and flagged, verification result, and any error with the last row written. State plainly if the sheet could not be reached or a write was refused.
