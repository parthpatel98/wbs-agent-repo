---
name: boundary-setting
description: The rule that sets the scope boundary. Classifies every unclear, unconfirmed or implied point as a requirement, assumption, parked item, exclusion or question, gives the wording for each, and defines the verification reviewers apply. Use when writing requirements, the blueprint or any WBS text, and when reviewing them.
---

# Boundary setting

This is the control that keeps the scope clear. Nothing unclear or unconfirmed is written as a fact. Every such point is classified, worded and recorded before the text is final.

## When to use
- The Requirements Analyst and Advisor, when sorting findings.
- The WBS Architect, in the blueprint boundary summary.
- The WBS Writer, for every feature.
- The QA Reviewer and Product Owner Reviewer, in the boundary check of every review.

## Classification

| Class | Meaning | Where it appears |
|---|---|---|
| **Requirement** | Confirmed in the inputs, the knowledge bank or a user answer | Bullets in Comments / Details |
| **Assumption** | Not confirmed. A reasonable default is built into this phase unless the client says otherwise. | `Assumptions:` block. Also Queries for Client if the client must confirm. |
| **Parked** | Useful or implied, but not part of this phase | `Assumptions:` block, as "Parked for next phase", and the Parked list |
| **Exclusion** | Out of scope and not planned | `Assumptions:` block, as "X is not included" |
| **Question** | Unclear, and the answer changes the scope materially | Asked to the user before the point is drafted |

Assumption means included on a stated basis. Parked means not included now, but a candidate for later. Exclusion means not included and not planned.

## Decision steps
Apply these steps in sequence to every point:

1. **Is it confirmed?** Find a source: a requirement ID, the knowledge bank, or a user answer. If yes, it is a **requirement**.
2. **Does the answer materially change the scope?** It does if it adds or removes a feature, a role, an integration, a data migration, or a different way of working for users. If yes, it is a **question** for the user. Do not draft the point until answered, or, if the user chooses to proceed, treat it as parked. The Writer cannot ask the user. Until the answer comes, it writes the narrower reading in the Assumptions block, as an exclusion or a parked item (for example "Delegation of approvals is not included."), so the cell is never silent about the point. It also lists the question in its return summary, and the Orchestrator asks the user. When the user answers, the Writer updates the cell in Apply mode.
3. **Is there a sensible default that fits this phase?** If yes, it is an **assumption**. If the client must confirm it, add a Queries for Client entry.
4. **Is the point valuable or implied, but outside this phase?** If yes, it is **parked**. Add the Parked list entry.
5. **Otherwise**, if it is clearly not wanted or not related, it is an **exclusion**.

If two classes seem to fit, choose the one that gives the narrower scope.

## Wording

Each point is one bullet in the `Assumptions:` block. Write plain statements in present tense. Use "will" only for a future action by a named party. Do not use "should".

- **Assumption:** state the basis. "The password policy is provided by the client."
- **Assumption with a default:** "Reset links expire after 24 hours unless the client specifies a different period."
- **Parked:** start with "Parked for next phase:". "Parked for next phase: reset by SMS."
- **Exclusion:** "Export to Excel is not included."
- **Dependency on another party:** "The Opter integration supports Create and Update only. Retrieving orders is not available."

Rules for wording:
- Be specific. Name the item, the value or the limit.
- Do not write "may", "might" or "possibly". If it is uncertain, it is an assumption or a question.
- One point per bullet.
- Do not repeat the same assumption in several features. State it once in the feature that owns it and refer to it by ID.

## Queries for Client
- Every assumption that the client must confirm or provide has one entry in Queries for Client in the same feature.
- Phrase as an action: "Client to provide the password policy." or "Confirm the expiry period of reset links."
- A query is specific enough to be answered in one reply.
- Do not add a query for an exclusion or a parked item.
- Add a query only when a wrong assumption would change the scope or the build. A common default that is cheap to change is an assumption without a query.
- Review any feature with more than five queries. Merge related queries and drop the minor ones.
- Do not invent a business rule to close a comment. A fix that narrows or changes what the sources state is a decision for the user.

## Recording

**In the cell:** the `Assumptions:` block, as above.

**In `requirements/register.md`, Parked list:**

| ID | Point | Feature ID | Reason | Suggested phase | Status |
|---|---|---|---|---|---|
| PK-001 | Reset by SMS | 1.3 | Not confirmed for this phase | Phase 2 | Parked |

- IDs run in sequence (`PK-001`, `PK-002`) and are never reused.
- Status: Parked, Accepted into scope, Dropped.
- The user reviews the Parked list at the cross-module check.
- If a parked item is accepted into scope, the Writer moves it to a requirement in the feature and updates the register.

**In the blueprint (section 7):** a module-level summary of what is in scope, assumed, parked and excluded, with references to the register.

## Where unclear points usually hide
Check every feature for these. If the source is silent, classify the point.

- Roles and permissions: who can do it.
- Volumes, limits and performance expectations.
- Languages and formats supported.
- File types and size limits.
- Notification channels and timing.
- Integration behaviour: what the other system supports, failure handling, overwrite rules.
- Data retention, deletion, archiving and privacy.
- Migration of existing data.
- Reports, exports and dashboards: screen only or downloadable.
- Validation rules and mandatory fields.
- Error and failure handling.
- Scheduling and frequency of background tasks.
- Customer-specific variations.
- Responsibility of the client or a third party.
- Time zones and date formats.

## Verification
Reviewers check each feature for:
1. No unclear point is written as a fact. Watch for "automatically", "all", "any", "always", "supports" with no source.
2. No scope is implied that was not confirmed. Watch for words such as "including", "such as" and lists that go beyond the baseline.
3. Every parked item appears in the Parked list with its source feature and reason.
4. Every assumption that needs the client has a Queries for Client entry, and every query has an assumption.
5. Exclusions do not conflict with other features.
6. The `Assumptions:` block states exclusions, not only assumptions.
7. A feature with no assumptions has a stated reason.

Comment severity:
- **Must fix:** an unclear point is written as a fact, scope is implied without a source, or a parked item is missing from the Parked list.
- **Should fix:** a query is missing or too vague, or the wording is not specific.

## Worked cases

**Case 1: the source says "users can reset passwords" and nothing more.**
- Requirement: users can reset their own password.
- Assumption: the password policy is provided by the client. Query: "Client to provide the password policy."
- Parked: reset by SMS or a security question. Parked list entry added.

**Case 2: the source mentions an integration but not what it can do.**
- Question to the user if the integration decides which features exist.
- Otherwise assumption: "The integration supports Create and Update only." Query: "Confirm the operations supported by the integration."

**Case 3: the Advisor suggests an audit trail that nobody asked for.**
- It stays a suggestion until the user decides.
- Accept into scope: becomes a requirement.
- Assume: an assumption stating what is recorded.
- Park: "Parked for next phase: audit trail of field changes." with a Parked list entry.
- Reject: not written.

**Case 4: the brief says "reports" with no detail.**
- Question to the user: which reports and in which form. This changes scope.
- If the user cannot answer now: "Parked for next phase: reports." and an exclusion "Export of reports to a file is not included."

**Case 5: a feature has no unclear points.**
- It still states what is excluded, for example "Printing is not included." If nothing applies, the review notes why there is no Assumptions content.
