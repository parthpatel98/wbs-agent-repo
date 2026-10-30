---
name: project-setup
description: How to start a WBS project. Covers the two guided question rounds, the details taken in plain text, the default folder structure, intake of attachments, the project profile and the project copy of the reference sheet. Use at the start of every new WBS project.
---

# Project setup

Setup collects what the agents need and builds the working folder. It is guided, with selectable questions, and it does not ask for what is already available.

## When to use
- Orchestrator, at the start of a project (checkpoint 1).

## Before asking
- Check whether the user has attached files or shared links. List them.
- Check whether `project-profile.md` already exists. If it does, resume from it. Do not start again.

## Round 1: material and work
Ask with selectable options:
1. **Material available** (multi-select): requirement brief, documents, prototype code, meeting notes, previous WBS, other.
2. **Where it is**: attached here, a folder or drive link, the project workspace, other.
3. **Knowledge bank**: exists (give location), does not exist, build one from the inputs.
4. **Kind of work**: new product, change to an existing product, migration or rebuild, other.

## Round 2: output and review
Ask with selectable options:
1. **Output destination**: Google Sheet (default, in the fixed reference format), markdown only.
2. **Publish timing**: after each module is approved, or once at the end.
3. **Reviews**: QA and Product Owner (default), Product Owner only, QA only.

## Plain text details
Ask in one message, for what cannot be selected:
- Project name.
- Client name and delivery party name.
- User roles.
- Legacy or connected systems.
- Terms with a fixed meaning (glossary).
- Document language.
- The link to the reference WBS sheet, if it has not been shared. The reference defines the format. It is not changed.

Say what will be assumed if an item is left blank, and continue.

## Folder structure
Ask the user to confirm the storage root once. Then create, inside it:

```
<project>/
  project-profile.md
  trace.md
  inputs/              original material, never edited
  knowledge-bank/      reusable reference notes
  requirements/
    <module>.md        requirement files, one per module
    baseline.md        approved requirements and module list
    register.md        questions and answers, assumptions, Parked list
  wbs/
    blueprint.md       approved structure
    <module>.md        one file per module
  _work/               temporary files, removed at the end
```

Use short file names in lower case, with hyphens. Module files take the module name. Keep the same name for a module in `requirements/` and `wbs/`.

## Intake of material
- Copy every attachment and linked document into `inputs/`. Keep the original file name. Do not edit them.
- For a link that cannot be copied, save a note with the link and the date, and record that the content was not copied.
- Large files: record the name, size and what part is relevant.
- List every input in `project-profile.md` with the date added and its type.
- Unreadable or empty files are reported to the user at once.

## project-profile.md
Sections:
1. Project: name, client, delivery party, language, start date.
2. Setup choices: all answers from rounds 1 and 2.
3. Roles and systems.
4. Glossary: term, meaning, terms not to be used.
5. Inputs: file, type, date added, notes.
6. Storage: root path, sheet link, tab name.
7. Status: current stage, next step.

Keep it short. Update it when anything changes.

## Project copy of the reference sheet
- Make a copy of the reference sheet for this project. Never write to the original.
- Clear the sample rows if the copy contains them, but keep the header row and formatting.
- Record the link and the tab name in `project-profile.md`.
- If the copy cannot be made, record that, keep markdown only, and tell the user.

## trace.md
Create it with the four sections: Approvals, Requirement-to-Feature Map, Publish Log, Cross-Module Review. Each starts with a table header and no rows.

## Task list
Create the task list for the stages: requirements, blueprint, each module, whole-WBS check, publish, clean-up. Add the modules once the blueprint is approved. Update after each stage.

## Close of setup
Show the user one summary: choices made, inputs found, folder created, sheet copy, what happens next. Then move to Stage 1.
