---
name: wbs-design
description: How to break approved requirements into modules, sub-modules and features for the WBS blueprint. Gives the breakdown method, naming and numbering rules, how to split or merge features, how to handle shared items and dependencies, and the coverage check. Use when building or changing the blueprint.
---

# WBS design

The blueprint decides what the WBS rows will be. A good breakdown means each feature can be described in one cell, reviewed on its own, and built without overlap with another.

## When to use
- WBS Architect, when building or changing the blueprint.
- QA Reviewer and Product Owner Reviewer, when a feature looks too large, too small or duplicated.

## Method
1. **Take the module list from the baseline.** Keep it unless there is a reason to change it. A change is an open point for the user.
2. **Order the modules.** Shared features first (sign-in, profile, notifications if used by all), then modules by role or work area, then administration, then background processing and integrations. Change the order where one module depends on another.
3. **Group requirements into capabilities.** A capability is something a user can do or the system does, with a clear start and result.
4. **Make each capability a feature.** One feature is one capability, or a closely related group that can be described together.
5. **Set sub-module labels.** Use a label to group features that belong together inside the module. A label is a grouping aid only.
6. **Name and number.** See below.
7. **Place shared behaviour once.** See below.
8. **Record dependencies.**
9. **Map every requirement.** Every baseline requirement is placed once, with a status.
10. **Run the coverage check.**

## Size of a feature
A feature should:
- Serve one user goal, or one closely related group of goals.
- Fit one cell: an introduction, a set of bullets, and an assumptions block.
- Be reviewable in a few minutes.

Split when:
- It covers unrelated user goals.
- It serves different roles with different data or rules.
- The description would need many topic headings on unrelated themes.
- Part of it depends on an integration or a decision that the rest does not.

Merge when:
- Two features repeat the same behaviour for the same users and data.
- One has only a single short rule that belongs to the other.

Use a sub-feature row (n.m.k) only when a feature has distinct parts that each need a row, and the parent row still introduces them. Do not use sub-features only to shorten a cell.

## Level of detail
Plan features at capability level. Do not make a stand-alone feature for a filter, a sort order, pagination, a button or a routine create, edit or delete variant that belongs to one capability. Describe them as bullets inside the feature. Split only for a different business goal, a different owner, a complex exception flow or an independent integration risk. Check both ways before the blueprint is shown: too many small features, and features so wide that a reviewer cannot check them in a few minutes.

## Module risk
Rate each module Low, Medium or High as the blueprint template describes. The rating decides whether the Product Owner review runs. It is a planning aid, not a finding.

## Naming
- Short noun phrases: "Leave request", "Approval queue", "Email notifications".
- Use the project glossary terms.
- Do not use verbs, abbreviations that the client does not use, or product slogans.
- Sub-module labels are plural or general area names: "Requests", "Administration".
- One name for one thing across modules.

## Numbering
- Modules: 1, 2, 3 in the drafting order. The header is `<n>. <Module name>`.
- Features: `n.1`, `n.2`, restarting in each module.
- Sub-features: `n.m.1`, `n.m.2`.
- IDs are text. They are never reused. A removed feature leaves a gap, noted in the change log.
- A feature added later takes the next free number in its module.

## Shared and cross-module items
Behaviour that several modules rely on is described once, in the feature that owns it. Examples: roles and permissions, notifications, audit history, language settings, common validations.
- List each in section 5 of the blueprint with the owner feature and users.
- Other features refer to the owner by ID. They do not repeat the behaviour.

## Dependencies
- "Depends on" lists feature IDs whose behaviour the feature relies on.
- A dependency that points to a later module is an ordering issue. Reorder or note it as an open point.
- A circular dependency is reported as an open point.

## Requirement coverage
- Every baseline requirement appears once in section 6.
- Covered: a feature describes it fully.
- Assumed, Parked, Excluded: the register or the boundary summary explains it.
- A requirement that does not fit any feature is an open point, not a new feature.

## What not to do
- Do not create a feature for something not in the baseline.
- Do not write feature text beyond the one-line scope.
- Do not split to make rows look short, or merge to make the list look small.
- Do not mirror the structure of the input documents or the code by default. Follow the work the user does.

## Coverage check
- All baseline requirements are listed once.
- Every feature has at least one requirement ID.
- No capability appears under two features.
- No feature contains scope outside the baseline.
- IDs follow the numbering rules.
- Feature names are short noun phrases using glossary terms.
- Every dependency uses a valid ID and points to the same or an earlier module, or is an open point.
