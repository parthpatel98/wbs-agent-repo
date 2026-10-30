---
name: completeness-rubric
description: The rubric and question banks used to check whether a module's requirements are complete enough to write the WBS. Gives the sections, what counts as complete, required and optional questions by kind of work, and how to report a gap. Use when checking requirement files for completeness.
---

# Completeness rubric

The rubric defines "enough detail to write the WBS". It is applied to each module. A section is complete when a person could write the feature text from the requirements without asking anything further, or when every remaining point is already classified under the boundary rule.

## When to use
- Completeness Reviewer, in Review and Re-check mode.
- Requirements Analyst and Orchestrator, to understand what will be checked.

## Status per section
| Status | Meaning |
|---|---|
| Complete | All required questions in the section are answered by a Confirmed requirement |
| Partial | Some are answered, some are not |
| Missing | None are answered, and the section applies |
| Not applicable | The section does not apply to this module. The reason is stated. |

A point classified as an assumption, parked or excluded in the register counts as answered.

## Sections and required questions

### 1. Purpose and users
- What is the module for, in one sentence?
- Which roles use it? What can each do?
- Who is not allowed to use it?

### 2. Functional behaviour
- For each capability: what can the user do, what is shown, what is recorded?
- What starts it and what is the result?
- What are the main steps, in order?

### 3. Data
- Which items are held? Which fields does each have?
- Which fields are mandatory? Formats, lengths, allowed values?
- Where does the data come from and who can change it?

### 4. Rules and validation
- Which business rules apply? Calculations, limits, conditions?
- Which validations apply and what message does the user get?
- Which values are fixed and which can be configured?

### 5. Status and workflow
- Which statuses exist and how does a record move between them?
- Who can make each change? Is it reversible?
- Are there approvals? Who approves and what happens on reject?

### 6. Roles and permissions
- Who can view, create, change, delete and approve?
- Do permissions differ by team, location or record owner?

### 7. Notifications
- Which events send a message? To whom? By which channel?
- Is the text fixed or configurable? Which language?

### 8. Reports and exports
- Which reports or lists are needed? Which filters and columns?
- Screen only, or downloadable? Which format?

### 9. Integrations
- Which systems are connected? What is sent and received?
- Which operations does each side support?
- What happens if the other system is not available?
- Who owns access, test data and documentation?

### 10. Errors and edge cases
- What happens on invalid input, missing data, duplicates, no permission?
- Cancellation, undo, correction after the fact?

### 11. Non-functional
- Number of users and volume of data.
- Performance, availability, support hours.
- Security: sign-in, data protection, audit.
- Language, time zone, date formats, devices, browsers.

### 12. History, retention and migration
- Is a history of changes needed? Who sees it?
- How long is data kept? Who can delete it?
- Is existing data moved in? From where, in what form?

### 13. Boundary
- What is explicitly out of this module?
- What is deferred to a later phase?

## Question banks by kind of work
Add these to the sections above.

**New product**
- Which problem does this solve and for whom (section 1)?
- Is there a reference product or process to follow?
- Which users and volumes at launch and after a year (section 11)?

**Change to an existing product**
- Which existing behaviour changes? Which stays?
- Which existing data and screens are affected (section 3)?
- Is the change released to all users at once?

**Migration or rebuild**
- Which functions of the old system carry over, change or are dropped?
- Which data moves, in what form, and who checks it (section 12)?
- Can old and new run side by side? For how long?

## Required and optional
- **Required:** the questions listed under each section above. A section that applies and has one unanswered required question is Partial.
- **Optional:** questions from the question banks. A gap in these is raised only if it affects scope.
- Sections 7 to 9 and 12 are Not applicable if the module has no such behaviour. State this as a finding, not an omission.

## Searching before asking
For each gap, search in this order:
1. The module's requirement file, in all sections.
2. Other module files and the register (answers, decisions, Parked list).
3. `knowledge-bank/`.
4. `inputs/`, including code and notes.

If the answer is found, report it with its location. Do not ask the user.

## Writing a question
Follow the question-writing skill. Each question:
- Names the module and section.
- States what is known, with the source.
- Asks one thing.
- Gives a recommended answer and its basis.
- States how the point will be treated if unanswered: assume, park or exclude.

## Verdict
- **Ready:** no Missing section, no open Scope question.
- **Ready with open points:** only Detail questions remain, each with a stated treatment if unanswered.
- **Not ready:** any Missing section, or any open Scope question.
