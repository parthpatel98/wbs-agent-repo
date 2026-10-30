---
document: WBS Blueprint
project: <project name>
version: 0.2
status: draft
requirement_baseline: <baseline version>
format_master: reference WBS sheet (see project-profile.md)
approved_by:
approved_on:
---

# WBS Blueprint: <project name>

## How to use this file

This file is the template for `wbs/blueprint.md`. The WBS Architect copies it, fills every section, and removes all lines that start with `Instruction:` before sending it for approval.

General instructions:
- Use only approved requirements from `requirements/baseline.md`. Do not add scope that is not in the baseline.
- The WBS format is fixed and follows the reference sheet. The blueprint only plans the modules and features that will be written in that format.
- Write in the style defined in the writing standard: short, formal, factual.
- Do not guess. If a point is unclear, classify it using the boundary rule (assumption, parked, or question) and record it in section 8.
- The blueprint defines structure and scope only. The full text for each feature is written later in `wbs/<module>.md`.
- The user approves this file before any module is drafted.

---

## 1. Basis

| Item | Value |
|---|---|
| Requirement baseline version | |
| Requirement files used | |
| Number of modules | |
| Number of features | |
| Prepared by | WBS Architect |
| Date | |

Instruction: Fill the counts after sections 3 and 4 are complete.

---

## 2. Structure (fixed format)

### 2.1 Row types and IDs

| Row type | ID format | Use |
|---|---|---|
| Module header row | 1, 2, 3 (shown as "1. Module name") | One per module, merged across columns A to G |
| Feature row | 1.1, 1.2 | One per feature. Numbering restarts in each module. |
| Sub-feature row | 1.1.1 | Only when a feature has distinct parts that need their own row. The parent feature row stays and introduces them. |

- Sub-Module is a grouping label in column C. It is not an ID level.
- IDs are text and sorted in natural order (1.2 before 1.10).
- IDs are not reused after a feature is removed. Removed IDs are noted in the change log.
- A feature added after approval takes the next free number in its module.
- Cross-references in WBS text use feature IDs.

Instruction: Do not change this table. It follows the reference sheet.

### 2.2 Columns

| Column | Name | Content | Filled by |
|---|---|---|---|
| A | # | Hierarchical ID, stored as text | Agents |
| B | Module | Module name, repeated on every feature row | Agents |
| C | Sub-Module | Grouping label for related features | Agents |
| D | Features | Short feature name | Agents |
| E | Comments / Details | Main description | Agents |
| F | Queries for Client | Points the client must confirm or provide. Empty when none. | Agents |
| G | Developer Comments | Reserved for the development team. Left empty. | Development team |

Instruction: Do not add, remove, rename or reorder columns.

### 2.3 Structure of Comments / Details
1. Introduction: one to three sentences on what the feature covers and who benefits.
2. Topic headings (optional): plain text lines, used when a feature covers several separate capabilities.
3. Bullets: start with `•`. Nested points start with `  -`. A short label and colon may start a bullet. Bullets state behaviour: what the user can do, what is shown, what is recorded, what is not done.
4. Assumptions block: the line `Assumptions:` followed by `•` bullets. It holds assumptions, exclusions and items parked for the next phase.

### 2.4 Planning rules for features
- A feature is one capability or one closely related group of behaviour that can be described in one cell. Several topic headings inside one feature are acceptable when they belong to the same theme.
- Split a feature when it covers unrelated user goals or different users with different data.
- Merge features that only repeat one short behaviour for the same users and data.
- Feature names are short noun phrases.
- The same capability must not appear under two features. Shared behaviour is described once and referenced by ID.
- Features that serve different roles may share a sub-module label.

### 2.5 Status values
Draft, In review, User review, Approved.

---

## 3. Module list

| No. | Module | Audience | Purpose | Requirement IDs | Features | Order | Status |
|---|---|---|---|---|---|---|---|
| 1 | | | | | | 1 | Draft |

Instruction:
- One row per module. The purpose is one sentence.
- The merged header row is built as `<n>. <Module name>`. Where the Audience column is filled, add `  |  <audience>` (two spaces around the bar), as in the reference. Fill Audience only where the module is meant for a defined group of users. Leave it empty otherwise. Do not type the bar character in this table.
- Suggested order, following the reference pattern: features shared by all users first, then modules by role or functional area, then administration, then background processing and integrations. Change the order where dependencies require it and give the reason in section 8.
- The order here is the order in which modules are drafted and reviewed.

---

## 4. Feature outline

Repeat this block for each module.

### Module <No.>: <Module name>

| ID | Sub-Module | Feature | Scope in one line | Requirement IDs | Depends on | Notes |
|---|---|---|---|---|---|---|
| | | | | | | |

Instruction:
- ID, Sub-Module and Feature are exactly the values that will appear in columns A, C and D.
- The scope line states what the feature covers in one sentence. It is not the full description.
- Every feature must have at least one requirement ID.
- "Depends on" lists feature IDs whose behaviour this feature relies on. Leave empty if none.
- Use Notes for a split or merge decision, or a reference to the register, for example "Parked items exist".

---

## 5. Shared and cross-module items

| Item | Described in feature | Used by features | Notes |
|---|---|---|---|
| | | | |

Instruction: List behaviour that several modules rely on, such as roles and permissions, notifications, audit history, language settings or common components. Describe each once, in one feature, and let other features refer to it by ID.

---

## 6. Requirement coverage

| Requirement ID | Short description | Feature IDs | Status |
|---|---|---|---|
| | | | Covered / Assumed / Parked / Excluded |

Instruction:
- Every baseline requirement appears here exactly once.
- Covered means a feature fully describes it. Assumed, Parked and Excluded must point to the register entry that explains the decision.
- No requirement may be left without a status. If one cannot be placed, add it to section 8.

Coverage check (completed by the Architect before submission):
- [ ] All baseline requirements are listed.
- [ ] Every feature has at least one requirement ID.
- [ ] No feature duplicates another.
- [ ] No feature contains scope outside the baseline.
- [ ] IDs follow section 2.1.

---

## 7. Boundary summary

| Category | Summary | Register reference |
|---|---|---|
| In scope for this phase | | |
| Assumed | | |
| Parked for next phase | | |
| Excluded | | |

Instruction: Summarise at module level. Each line points to entries in `requirements/register.md`. Every unclear or unconfirmed point must be classified here before approval.

---

## 8. Open points before approval

| No. | Point | Type | Recommended action | Decision | Decided by / date |
|---|---|---|---|---|---|
| | | Question / Assumption / Parked / Structure | | | |

Instruction:
- Include any structural decision that needs the user's view, such as a proposed split or merge, module order or a missing requirement.
- Give a recommended action for each point. Keep the list short and ordered by impact.
- All points need a decision before the status changes to Approved.

---

## 9. Approval

| Item | Entry |
|---|---|
| Reviewed by | |
| Decision | Approved / Approved with changes / Returned |
| Comments | |
| Date | |

---

## 10. Change log

| Version | Date | Change | Reason | Changed by |
|---|---|---|---|---|
| 0.1 | | First draft | | WBS Architect |

Instruction: After approval, record every change to modules, features, IDs or order. Name the modules whose WBS must be reopened because of the change.
