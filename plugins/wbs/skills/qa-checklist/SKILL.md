---
name: qa-checklist
description: The detailed check list the QA Reviewer applies to a module file and to the whole WBS. Gives the order of checks, what to look for, how to set severity, how to write a comment and how to re-check. Use when reviewing format, accuracy, completeness, consistency, boundary and writing.
---

# QA checklist

The QA Reviewer checks the module against the format, the sources and the writing standard. The review file layout and verdict rules are in the QA Reviewer agent file. This skill gives the detail of each check.

## When to use
- QA Reviewer, in module review, re-check and cross-module mode.

## Method
1. Read the blueprint section for the module first. It is the reference for IDs, names and requirement IDs.
2. Read the module file block by block, in order.
3. For each block, run the checks below in the stated order. Record a comment at once. Do not rely on memory.
4. After all blocks, run the module-level checks.
5. Run the format validation script if the project provides one. Treat its output as input to the review, not as the review.

## Block-level checks

### A. Format
- Heading is `### <ID>`. The ID exists in the blueprint. No ID is repeated.
- `- Module:`, `- Sub-Module:` and `- Feature:` lines are present and match the blueprint exactly.
- Details start with an introduction of one to three sentences.
- Bullets use `•`. Nested points use `  - `. No other markers.
- Topic headings are plain text, with no markdown symbols.
- `Assumptions:` is present, spelled exactly, and is the last block in the cell.
- No bullets after the Assumptions block. No blank line at the start or end of the cell text.
- Queries for Client is filled or reads `None`.
- No text for Developer Comments.

### B. Accuracy
- Each bullet traces to a requirement ID, a register entry or an accepted suggestion. If it does not, it is a Must fix.
- Numbers, units, role names and system names match the source.
- No bullet contradicts another bullet, another feature or the baseline.
- Cross-references name existing IDs and describe the right feature.

### C. Completeness
- Every requirement assigned to the feature is covered, assumed, parked or excluded.
- Every blueprint feature has a block. No block exists that is not in the blueprint.
- Roles, status changes, validations and failure cases in the source appear in the text.

### D. Consistency
- One term for one thing, per the glossary in `project-profile.md`.
- Behaviour bullets use "should". Assumptions use plain statements.
- Same rule is stated once. Repeats are references to the owning feature.
- Similar features are written in the same pattern.

### E. Boundary
Apply the Verification list in the boundary-setting skill to every block.

### F. Writing
Apply the self-edit checklist in the writing-standard skill. Look for:
- Bullets over 25 words, or with more than one behaviour.
- Avoid-list words, filler, marketing wording, emojis.
- Names of people. Values that should be configurable written as fixed.
- Passive or vague wording where a specific statement is possible.

## Module-level checks
- Feature order and numbering follow the blueprint with no gaps.
- Front matter has module, status, version and baseline. Baseline matches `requirements/baseline.md`.
- Every Parked item in the cells has a Parked list entry, and every entry points to the right feature.
- The Change Log has an entry for each version.
- The Review Log was not edited by the Writer, apart from status and responses.

## Cross-module checks
- One feature does not appear in two modules.
- The same term, role and rule are the same in all modules.
- Every requirement in the baseline maps to at least one feature (use the Requirement-to-Feature Map in `trace.md`).
- Cross-references between modules point to approved features.
- Assumptions in different modules do not conflict.
- The Parked list has no duplicates and no item that is also in scope elsewhere.
- Exclusions in one module do not remove a capability promised in another.

## Severity
- **Must fix:** wrong or untraceable statement, missing feature or requirement, broken format that blocks publishing, an unclear point written as a fact, a parked item not in the Parked list.
- **Should fix:** inconsistent term, weak or missing query, wording that is not specific, bullet that is too long.
- **Note:** an observation that needs no change.

Do not raise a Must fix for a style point. Do not raise a Note to avoid a decision.

## Writing a comment
- One issue per comment.
- Name the feature ID.
- State what is wrong and where, in one or two sentences.
- Give a suggested change that the Writer can apply without asking.
- Set `Needs user decision` = Yes only when the fix needs a business choice, a client answer or a scope change.
- Do not rewrite the whole bullet unless needed. Quote the short part that is wrong.

Example:

| No. | Feature ID | Severity | Comment | Suggested change | Needs user decision | Status |
|---|---|---|---|---|---|---|
| Q4 | 2.3 | Must fix | The bullet "Managers can approve any request" has no source and sets the approval scope. | Limit to requests from the manager's own team as in REQ-014, or add the broader scope as a question. | Yes | Open |

## Re-check
- Check only the comments in the list given. Open the changed text and confirm the fix.
- `Resolved` only if the text now meets the check. Otherwise `Open` with a short note.
- If the fix created a new problem, raise a new comment with the next number.
- Do not raise new comments on text that did not change.

## Verdict
- Pass: no Must fix and no Should fix.
- Pass with comments: Should fix only.
- Return: any Must fix.
