---
document: Requirement Register
project: <project name>
---

# Register

Decisions, answers, findings and parked items for the project. Entries are never deleted. A change is a new entry or a change of status, with the date.

## Clarifications

Questions put to the user. The answer is a confirmed requirement. `Applied` holds the requirement file and version in which the answer was applied.

| ID | Module | Question | Recommended | Answer | Source of answer | Date | Applied |
|---|---|---|---|---|---|---|---|

## Suggestions

Findings from the Advisor. The user decides each one: Accept into scope, Assume, Park or Reject. Nothing is scope until it is accepted.

| ID | Type | Module | Finding | Evidence | Recommended action | Impact | Decision | Date | Applied |
|---|---|---|---|---|---|---|---|---|---|

## Assumptions

Project-level assumptions. Feature-level assumptions are in the module files.

| ID | Assumption | Module | Basis | Client to confirm |
|---|---|---|---|---|

## Parked list

Items left for a later phase. IDs are never reused. Status: Parked, Accepted into scope, Dropped. The user reviews this list at the cross-module check.

| ID | Point | Feature ID | Reason | Suggested phase | Status |
|---|---|---|---|---|---|
