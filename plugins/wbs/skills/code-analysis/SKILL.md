---
name: code-analysis
description: How to read prototype or source code as a requirement input. Shows how to derive screens, features, roles, data, rules and integrations, how to treat unfinished or placeholder parts, and how to record findings with sources. Use when the inputs include code.
---

# Code analysis

Prototype code shows what someone built or tried. It is evidence of intent, not an approved requirement. Everything taken from code is recorded with its source file and is marked for confirmation where the code is incomplete.

## When to use
- Requirements Analyst, when `inputs/` holds code or a code export.

## Method
1. **Map the code.** List the folders and main files. Identify the framework, the entry point, the route or screen list, and the data definitions. Record the names of the main files.
2. **Find the screens and routes.** Each route, page or screen is a candidate feature. Record the name, the path and the file.
3. **Find the actions.** For each screen, list what the user can do: forms, buttons, links, API calls. Record the label shown to the user.
4. **Find the data.** Read models, schemas, types and sample data. Record entities, fields, types, mandatory fields and relations.
5. **Find the rules.** Read validation, conditions, calculations, status changes and permission checks. Record each as a rule with the file and line range.
6. **Find the roles.** Look for role names, permission checks, guarded routes and menu differences.
7. **Find integrations.** Look for API clients, URLs, keys, webhooks, import and export, email and notification code. Record the system and what is sent or received.
8. **Find the unfinished parts.** See below.
9. **Compare with the other inputs.** Note where the code agrees with the brief, where it goes further, and where it differs.

## Read the visible text
Labels, messages, option lists and placeholder text show the wording the users see. Use them as the terms for the glossary, and record them.

## Unfinished and placeholder parts
Mark as `Unclear` and say why. Typical signs:
- Comments such as TODO, FIXME, "later", "temporary".
- Hard-coded sample data, test names or fake values.
- Buttons or links with no action, empty handlers, routes that lead nowhere.
- Functions that return a fixed value, or code that is switched off.
- Screens with no data source.
- Missing validation, missing error handling, no permission check.

A feature that exists only as a screen with no behaviour is recorded as `Proposed` with the note "screen present, behaviour not defined".

## What not to do
- Do not treat implementation details as requirements (library choice, folder structure, variable names) unless the brief names them.
- Do not treat a default or a hard-coded value as a confirmed business rule. Record it as the prototype value and mark it `Unclear`.
- Do not copy secrets, keys or passwords into any file. Record only that an integration exists and the system it uses.
- Do not assume code that is present is in scope. A function found only in code, with no support in the brief, documents or notes, is recorded with status `Proposed`. It stays out of the baseline until the user accepts it.

## Recording
Write each finding as a requirement in the module file (see requirements-extraction). Use the source form `file:line-range` or `file, screen name`. Put screens and flows in the Screens and flows section. Type `Rule` for validation and status logic, `Data` for entities and fields.

## Check before returning
- Every route or screen is listed once.
- Every rule has a file and line range.
- Every placeholder or unfinished part is marked Unclear.
- No secret appears in any output.
- Differences from the other inputs are listed.
