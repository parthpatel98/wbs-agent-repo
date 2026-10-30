---
name: trace-and-cleanup
description: How the WBS process keeps its record in markdown and removes unneeded files at the end. Covers what is recorded where, the trace.md sections, module status and version rules, and the clean-up list and approval. Use when recording an approval or decision, and at the end of the project.
---

# Trace and clean-up

Every decision is written in a file. Nothing is kept only in the conversation. At the end, working files are removed, and the record stays.

## When to use
- Orchestrator, at each approval and decision, and at clean-up.
- Writer, Publisher and QA Reviewer, when they write to the files listed here.

## What is recorded where

| Item | Where | Written by |
|---|---|---|
| Approval of baseline, blueprint, module, publish | `trace.md`, Approvals | Orchestrator |
| Module review comments and responses | Module file, Review Log | Orchestrator (rounds), Writer (status, responses) |
| Module changes | Module file, Change Log | Writer |
| User answers to questions | `requirements/register.md` | Orchestrator |
| Assumptions and queries | Module file | Writer |
| Parked items | `requirements/register.md`, Parked list | Writer |
| Which requirement is covered by which feature | `trace.md`, Requirement-to-Feature Map | Orchestrator |
| Publishing | `trace.md`, Publish Log | Publisher |
| Whole-WBS findings | `trace.md`, Cross-Module Review | QA Reviewer |
| Setup choices, inputs, glossary | `project-profile.md` | Orchestrator |
| Current stage, module status, what waits for the user, next step | `status.md` | Orchestrator |
| Every assumption, exclusion, parked item and question, with the decision and treatment | `requirements/register.md`, Decisions | Writer (new rows), Orchestrator (decisions) |
| Review summary of each round | Module file, Review Log (`#### Review Summary`) | Orchestrator |
| Source of each assumption bullet | Module file, Traceability | Writer |

## trace.md
Four sections, each a table.

**Approvals**

| Date | Item | Version | Decision | By | Note |
|---|---|---|---|---|---|

Items: baseline, blueprint, each module, publishing, clean-up.

**Requirement-to-Feature Map**

| Requirement ID | Feature IDs | Module |
|---|---|---|

Every baseline requirement appears at least once. A requirement that is parked or excluded appears with the register ID in place of a feature ID.

**Publish Log**: see the publish-sheet skill.

**Cross-Module Review**: same comment table as a module review, with the status of each finding.

## Entry rules
- Date format `YYYY-MM-DD`.
- One line per entry. Do not rewrite or delete earlier entries. A correction is a new entry.
- State the decision, not the discussion.
- Use IDs (module, feature, comment, register) so that an entry can be traced.

## Status and version of a module
- Statuses: `draft`, `in review`, `user review`, `approved`.
- Draft is version 0.1. Each revision adds 0.1.
- On approval, the version becomes the next whole number.
- A module changed after approval goes back to `in review`, with a version increase of 0.1 from the whole number, and goes through review and approval again.
- The Orchestrator sets the status. The Writer sets the version when it saves a revision.
- A module with any `[PENDING` line, or any Decisions row for its features in status Pending decision, cannot be set to `approved`.

## Review Log rules
- Round entries are added by the Orchestrator only, from the reviewers' files.
- Comment numbers continue across rounds (Q1, Q2 ... P1, P2 ...). They are never reused.
- The Writer changes the status of a comment and the Responses and Decisions table. Nothing else.
- A reviewer comment that is overridden by the user is set to Deferred or Resolved, with the decision written in the response.

## Clean-up
Done at the end (Stage 5), after publishing, and only with the user's approval.

### Files that stay
- `inputs/` and everything in it.
- `project-profile.md`, `status.md`, `knowledge-bank/`.
- `requirements/` (module requirement files, `baseline.md`, `register.md`).
- `wbs/blueprint.md` and the approved module files.
- `trace.md`.

### Files that are removed
- Everything in `_work/`: review files, simulated copies, old drafts, check output.
- Earlier versions of a file that was replaced.
- Duplicates and scratch files that the agents created.

### Steps
1. List the files in the project folder. Mark each as stay or remove, with a reason.
2. Check that each file to be removed was created by an agent and its content is kept elsewhere. Review files are kept in the Review Log. Do not remove a file that has content found nowhere else.
3. Show the user the remove list. Ask for approval.
4. After approval, remove the files. Record the removal in `trace.md` Approvals, with the number of files removed.
5. Confirm that the folder now holds only files that stay.

### Rules
- Never remove files that the user added or that agents did not create.
- Never remove `inputs/`.
- Do not remove anything without approval, including files that look empty.
- If the user wants to keep a file on the list, keep it and note it.
- If a module is reopened after clean-up, the work files for the new round are created again and cleaned at the end of the round.
