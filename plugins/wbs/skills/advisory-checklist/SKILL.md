---
name: advisory-checklist
description: What the Advisor looks for beyond the user's inputs, how to report each finding, how to rank findings, and how to keep the list useful. Use when reviewing requirement files for gaps, risks, conflicts and missing items.
---

# Advisory checklist

The Advisor adds what the inputs do not say. The test for each finding is whether the user would want to know before the WBS is written.

## When to use
- Advisor, in Review and Re-review mode.

## Finding types
| Type | Meaning |
|---|---|
| Gap | Something the work needs that the requirements do not state |
| Risk | Something stated that may cause trouble: a dependency, a limit, a hard rule |
| Conflict | Two statements or sources that cannot both be right |
| Suggestion | A capability commonly expected for this kind of work that is not asked for |

## What to look for

### Roles and access
- A role named but with no stated permissions.
- A function with no stated user.
- Who manages users, roles and master data.
- Approval and delegation when someone is away.

### Behaviour and errors
- The unhappy path: invalid input, no permission, no data, duplicates, cancel and undo.
- Status changes with no defined end state.
- Concurrent changes to the same record.

### Data and history
- Audit trail: who changed what, when.
- Retention, deletion and archiving. Privacy and personal data.
- Import of existing data and migration from a legacy system.
- Data ownership and who corrects errors.

### Integrations
- What the other system supports, and what it does not.
- Failure handling: retry, queue, alert, manual fallback.
- Overwrite and sync rules; which system holds the master data.
- Who provides access, test data and documentation.

### Notifications and outputs
- Channels, timing, recipients and language.
- Reports and exports: screen only, or download; formats; who can run them.

### Non-functional
- Volume of users and data. Performance expectations.
- Availability and support hours. Backup and recovery.
- Security: sign-in method, password rules, session limits, data protection.
- Language, time zone, date and number formats, accessibility.
- Devices and browsers.

### Commonly expected items
- Search, filter and sort on lists. Pagination.
- Bulk actions. Attachments.
- Reminders and escalations.
- Help text or guidance.
- Configuration of values that the client will want to change.

Raise a commonly expected item only if it fits the product and the module.

### Across modules
- A term used differently in two modules.
- A rule stated in one module and contradicted in another.
- Behaviour used by several modules and not described anywhere.
- A dependency between modules that affects the order of work.
- A requirement that appears in two places.

### Sources
- Statements in the inputs that disagree with each other.
- A prototype that does more or less than the brief says.
- Ambiguous wording: "all", "any", "automatically", "as needed", "etc.".
- Dates, numbers and names that differ between files.

## How to report
Each finding has: type, module, finding, evidence, recommended action, impact. The recommended action is one of:
- **Accept into scope:** the work clearly needs it and the cost of leaving it out is high.
- **Assume:** a sensible default exists. State the default.
- **Park:** useful, but outside this phase.
- **Reject:** not relevant to this product.

Give the reason in one short sentence.

## Ranking
- **High:** affects scope, cost or delivery materially. Examples: an unconfirmed integration capability, a conflict in a core rule, a legal or security need.
- **Medium:** affects the clarity or completeness of a feature.
- **Low:** minor or optional. Group in one entry per module.

Present High first. Keep the whole list short enough to read in one sitting. If more than about fifteen findings remain after grouping, the first list holds the High and Medium findings only. Say that Low findings were grouped.

## Wording
- One finding, one point.
- Name the cause and effect of a risk: "If the integration supports Create and Update only, orders cannot be retrieved. This affects 3.2."
- No loaded words such as "critical" or "must" without a stated reason.
- Do not state a view as a fact. Where the evidence is partial, say what is known and what is not.

## What not to do
- Do not rewrite the requirements.
- Do not decide scope.
- Do not repeat a point that has a decision or a Parked list entry.
- Do not list the whole checklist as findings. Raise only what applies.
