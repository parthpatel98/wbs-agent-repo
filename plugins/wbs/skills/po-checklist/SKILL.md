---
name: po-checklist
description: The check list and questions the Product Owner Reviewer uses to judge a module from a scope, clarity, user value and risk point of view, and to propose missing items as suggestions. Use when reviewing a module file.
---

# Product Owner checklist

The Product Owner Reviewer reads the module as the owner of the product would. The question is whether the team could build and test each feature from this text, and whether the scope is right. Format and wording belong to the QA Reviewer.

## When to use
- Product Owner Reviewer, in module review and re-check mode.

## Method
1. Read the module's purpose in the blueprint and the baseline sections it covers.
2. Read each feature as a user, then as a developer, then as a tester.
3. Ask the questions below. Record a comment for each answer that is "no" or "not clear".
4. Then read the whole module once for gaps between features.

## Questions per feature

### User and purpose
- Who uses this feature? Is it clear from the text or from the module banner?
- What does the user achieve with it?
- Is the feature needed in this phase, according to the baseline?

### Behaviour
- Can a tester write a pass or fail test from each bullet?
- Are the inputs, the result and the visible outcome stated?
- Are conditions, limits and defaults stated where they affect the result?
- Is the order of steps or the status flow clear where there is one?
- Are the failure cases covered where the user would meet them (invalid input, no permission, no data, external system not available)?

### Roles and rules
- Who can do each action? If not stated here, does the text point to the feature that states it?
- Which business rules apply? Are they written as rules, not left to the developer?
- Which records are created, changed or kept as a result? Is there a history where one is expected?

### Notifications and outputs
- Which notifications, messages, reports or exports are sent or shown? To whom? On which event?
- Is it stated whether an output is shown on screen only or can be downloaded?

### Dependencies
- Does the feature depend on another feature, a system or a client input? Is the ID or name correct?
- Is the order of delivery affected?

### Boundary
- Is every unclear point an assumption, a parked item or an exclusion?
- Is each assumption specific enough to be wrong or right?
- Does each query ask for one thing that the client can answer?
- Would the client read the Assumptions block and know what is not included?

## Questions for the whole module
- Does the module cover what its purpose says?
- Is there a step in the user's work that no feature covers?
- Do features overlap, or conflict with a feature in another module?
- Is anything promised that the baseline does not confirm?
- Is the module too large for review as one unit? If so, say where it could be split.

## Suggestions
Suggestions are ideas outside the confirmed scope. They help the user decide. They are not requirements.

Look for:
- Capabilities commonly expected for this kind of feature that the sources do not mention, such as audit history, search and filters, bulk actions, import or export, reminders, delegation, retention rules.
- Risks: unclear ownership, data loss, security or privacy exposure, a dependency on a system not yet available.
- Conflicts between features or with the client's stated process.

Rules for a suggestion:
- Severity is Suggestion and `Needs user decision` = Yes.
- State the idea in one sentence and why it matters.
- State the proposed treatment: accept into scope, assume, or park. Give a recommended one.
- Keep to what is relevant to this module. Do not list ideas for the sake of a long list. Three good suggestions are better than ten weak ones.
- Do not write a suggestion that repeats a Parked list entry.

## Severity
- **Must fix:** a scope, clarity or boundary problem that blocks approval. Examples: a feature that cannot be tested as written, a capability missing that the baseline requires, scope promised without a source.
- **Should fix:** a clarity gap that the Writer can close from the sources. Examples: actor not stated, outcome not stated, failure case missing.
- **Note:** an observation that needs no change.
- **Suggestion:** an idea outside confirmed scope.

## Writing a comment
- One issue per comment, with the feature ID.
- Say what the reader cannot tell, in plain words. Example: "The text does not say who can cancel an approved request."
- Give the change that would answer it. If the answer is not in the sources, set `Needs user decision` = Yes and say what to ask.
- Raise an issue from the product point of view even if QA may also raise it. The Orchestrator groups duplicates.

Example:

| No. | Feature ID | Severity | Comment | Suggested change | Needs user decision | Status |
|---|---|---|---|---|---|---|
| P3 | 3.2 | Should fix | The text does not say what the employee sees when the balance is not enough. | Add a bullet: the request should be rejected with a message that shows the available balance. | No | Open |

## Re-check
- Check only the comments in the list given.
- `Resolved` if a tester could now work from the text. Otherwise `Open` with a short note.
- Do not add new Suggestions in a re-check.

## Verdict
- Pass: no Must fix and no Should fix.
- Pass with comments: Should fix only.
- Return: any Must fix.
