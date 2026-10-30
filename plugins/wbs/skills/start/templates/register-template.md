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

## Decisions

One row for every assumption, exclusion, parked item and question. A point is resolved only when its row is Decided. Appearing in an Assumptions block or in Queries for Client does not resolve it.

Tier A: needs the user's answer. Tier B: recommended default, accepted by group. Tier C: technical detail left to the development team, not shown for decision.

Status: Pending decision (Tier A, needs an answer), Proposed default (Tier B, awaiting acceptance), Logged (Tier C), Decided. Before the decision, `Agent recommendation` holds the proposed treatment and a short reason, and `User decision` and `Resulting treatment` are empty. After the decision, `Resulting treatment` is one of: In scope, Assumed, Parked (with PK id), Excluded, Dropped, Left to development team. `Basis` is set at the decision: Client source (the client's own material states it), Team decision (the user decided, no client evidence) or Needs client confirmation. `Applied in` is filled when a decision changed a requirement or the WBS: the requirement file and version, and the feature ID. `Date` is the date of the last change.

| ID | Point | Source or reason | Feature ID | Module | Tier | Agent recommendation | User decision | Resulting treatment | Basis | Applied in | Status | Date |
|---|---|---|---|---|---|---|---|---|---|---|---|---|

## Precedents

A decision that the user wants applied to later points of the same type. Applied precedents are reported in the module review summary.

| ID | Rule | Applies to | From decision | Date |
|---|---|---|---|---|


## Parked list

Items left for a later phase. IDs are never reused. Status: Parked, Accepted into scope, Dropped. The user reviews this list at the cross-module check.

| ID | Point | Feature ID | Reason | Suggested phase | Status |
|---|---|---|---|---|---|
