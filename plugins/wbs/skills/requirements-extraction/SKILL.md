---
name: requirements-extraction
description: How to read mixed project inputs and turn them into numbered, sourced requirements grouped by module. Gives the requirement file layout, the baseline layout, status values and rules for splitting, sourcing and marking unclear points. Use when writing or updating requirement files.
---

# Requirements extraction

The aim is a list of single, sourced statements that the WBS can be built from. The list records what the sources say, not what the analyst thinks they mean.

## When to use
- Requirements Analyst, in Intake and Update modes.
- Any agent that needs to read a requirement file.

## Reading the inputs
- Read every file in full. Note the type: brief, document, notes, code, data.
- Notes and meeting records often hold decisions that the brief lacks. Read them as sources, and mark them as less formal.
- When two inputs differ, the later dated input is not automatically correct. Record both and mark a conflict.
- Keep track of where each statement came from while reading. Adding the source afterwards is error-prone.

## What counts as a requirement
A statement of something the product must do, show, store, send, limit or integrate with, or a rule or constraint on it. Include:
- Functional behaviour for each role.
- Data to be held and rules on it.
- Rules, validations, limits and status changes.
- Notifications, reports and exports.
- Integrations and what each side does.
- Non-functional needs: volume, performance, availability, security, language, time zone, device.
- Constraints: legacy systems, dates, standards, client responsibilities.

Do not include background, history or marketing text, unless it states a need.

## Writing a requirement
- One statement. If it holds "and" between two behaviours, split it.
- Start with the actor or the system: "The employee can ...", "The system stores ...".
- Keep the source's numbers, names and limits exactly.
- Use the project glossary terms. Note a new term once, with the source wording.
- Use roles, not names of people.
- Do not add detail that the source does not give.

## Numbering
`REQ-001`, `REQ-002` in one sequence across all modules. IDs are not reused or renumbered. A requirement that is dropped is marked `Withdrawn` with a reason.

## Status values
| Status | Meaning |
|---|---|
| Confirmed | Stated clearly in a source |
| Unclear | The source is silent, vague or open to two readings. The note says why. |
| Conflict | Two sources differ. Both are named. |
| Withdrawn | No longer applies. The reason is stated. |

## Sources
Write the source as `file, location`: page, section heading, line range or screen name. For a user answer: `User answer CL-004`. For an accepted suggestion: `Suggestion SG-012`.

## Grouping into modules
- Group by the work the user does or the area of the system, not by input file.
- Start with what the sources already use as headings or menus.
- A module has one purpose in one sentence and a defined set of users.
- Shared behaviour used by all roles (login, profile, notifications) can be its own module.
- Keep the list manageable. Many small modules are harder to review than a few clear ones, but a module should not be so large that a single review is hard to read.
- An item that fits two modules goes in the one it mainly serves, with a note.

## Requirement file layout (`requirements/<module>.md`)
```
---
module: <name>
purpose: <one sentence>
audience: <defined group, or none>
version: 0.1
status: draft
---

## Roles
<role: short description>

## Requirements
| ID | Requirement | Type | Source | Status | Note |
|---|---|---|---|---|---|

## Screens and flows
<only when taken from prototype or documents: screen, purpose, main actions>

## Terms
<term: source wording>

## Open points
<unclear points and conflicts, by requirement ID>

## Change Log
| Version | Date | Change | Reason | Changed by |
|---|---|---|---|---|
```
Type: Functional, Data, Rule, Notification, Report, Integration, Non-functional, Constraint.

## Baseline layout (`requirements/baseline.md`)
```
---
version: 0.1
status: draft | approved
approved_on:
---

## Modules
| No. | Module | Audience | Purpose | Requirement count |
|---|---|---|---|---|

## Requirement index
| ID | Module | Status |
|---|---|---|

## Change Log
| Version | Date | Change | Reason | Changed by |
|---|---|---|---|---|
```
The Requirements Analyst writes the content. The Orchestrator sets the status, version and approval date.

## Marking unclear points
Apply the boundary-setting skill. If a source is silent on something the feature needs, record it in Open points. Do not add a requirement for it. Do not choose a reading.

## Check before returning
- Every input is read or reported as unreadable.
- Every requirement has a source and a status.
- No requirement holds two behaviours.
- No requirement ID is repeated.
- Every module has a purpose and roles.
- Every conflict names both sources.
