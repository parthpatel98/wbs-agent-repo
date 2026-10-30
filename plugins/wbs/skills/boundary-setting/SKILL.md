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
| **Requirement** | Confirmed in the inputs, the knowledge bank, a user answer, or a user decision (including an accepted default) | Bullets in Comments / Details |
| **Assumption** | A basis the work depends on that the client or a third party must provide or confirm, or an external fact not yet known | `Assumptions:` block. Also Queries for Client if the client must confirm. |
| **Parked** | Useful or implied, but not part of this phase | `Assumptions:` block, as "Parked for next phase", and the Parked list |
| **Exclusion** | Out of scope and not planned | `Assumptions:` block, as "X is not included" |
| **Question (Pending decision)** | Unclear, and the answer changes the scope or sets a business rule | Asked to the user. Until decided it is not written as a requirement, an assumption or an exclusion. A line `[PENDING AS-nnn: <short point>]` marks the place in the cell. |
| **Left to development team** | A technical implementation detail inside an accepted requirement, with no effect on what users see, what is kept, or what the client must live with | Not written in the cell. Logged in the register as Tier C. |

An accepted default is not an assumption. When the user accepts a recommended rule (for example "a request with a start date in the past is rejected"), it is decided, and it is written as a normal behaviour bullet with its source in Traceability. An assumption states a basis that someone else must supply, for example "The client provides the working days of the week." Behaviour is never written as an assumption. Assumption means included on a stated basis. Parked means not included now, but a candidate for later. Exclusion means not included and not planned.

## Decision steps
Apply these steps in sequence to every point:

1. **Is it confirmed?** Find a source: a requirement ID, the knowledge bank, or a user answer. If yes, it is a **requirement**.
2. **Does the answer materially change the scope or set a business rule?** It does if it adds or removes a feature, a role, an integration, a data migration or a way of working for users, if it narrows an accepted requirement, or if it fixes a rule the sources do not state. If yes, it is a **question** (Tier A). Record it in the Decisions table with status Pending decision. Do not draft it, and do not write it as an assumption or an exclusion. Put a `[PENDING AS-nnn: <short point>]` line in the cell. The Writer cannot ask the user. It records the point, and the Orchestrator asks the user. After the decision, the Writer updates the cell in Apply mode and removes the line.
3. **Is there a sensible default that fits this phase, and does it add no scope and remove none?** If yes, it is Tier B. The recommended treatment is **In scope** for a rule or behaviour inside a planned feature, or **Assumed** when the default rests on something the client must provide or confirm. If the client must confirm it, add a Queries for Client entry.
4. **Is the point valuable, but not asked for by any accepted requirement, and outside this phase?** If yes, it is **parked**. Add the Parked list entry. If an accepted requirement implies the point, parking it narrows the requirement. Go back to step 2.
5. **Otherwise**, if it is clearly not wanted or not related, and no accepted requirement asks for it, it is an **exclusion**.

If two classes seem to fit, treat the point as a question. Do not choose the narrower or the wider reading yourself.

## Wording

Each point is one bullet in the `Assumptions:` block. Write plain statements in present tense. Use "will" only for a future action by a named party. Do not use "should".

- **Assumption:** state the basis. "The password policy is provided by the client."
- **Assumption with a default:** "Reset links expire after 24 hours unless the client specifies a different period."
- **Parked:** start with "Parked for next phase:". "Parked for next phase: reset by SMS."
- **Exclusion:** "Export to Excel is not included." Only for something that no accepted requirement asks for, or that the user has decided to exclude.
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
- Add a query only when a wrong assumption would change the scope or the build. A common default that is cheap to change needs no query. The query rule decides, not the recommendation text in the register.
- A feature with more than five queries is reviewed before it is returned. Merge related queries and drop minor ones.
- Do not invent a business rule to close a comment. A fix that narrows or changes what the sources state is a decision for the user.

## Recording

**In the cell:** the `Assumptions:` block, as above.

**In `requirements/register.md`, Decisions table:** every assumption, exclusion, parked item and question has one row, with the columns shown in the register template: ID (`AS-001`, in one sequence), point, source or reason, feature, tier, agent recommendation, user decision, resulting treatment, status (Pending decision or Decided) and date. A point is not resolved because it appears in an Assumptions block or a Queries for Client entry. It is resolved when its row is Decided.

**In `requirements/register.md`, Parked list:**

| ID | Point | Feature ID | Reason | Suggested phase | Status |
|---|---|---|---|---|---|
| PK-001 | Reset by SMS | 1.3 | Not confirmed for this phase | Phase 2 | Parked |

- IDs run in sequence (`PK-001`, `PK-002`) and are never reused.
- Status: Parked, Accepted into scope, Dropped.
- The user reviews the Parked list at the cross-module check. Every Parked list entry has a Decisions row.
- If a parked item is accepted into scope, the Writer moves it to a requirement in the feature and updates the register.

**In the blueprint (section 7):** a module-level summary of what is in scope, assumed, parked and excluded, with references to the register.

## Tiers and the decision register
Every point that is not a confirmed requirement gets a tier. The tier decides how the user sees it.

The test that separates A from B: **would a wrong default change what is built?** If the answer is yes, the point is Tier A. If a wrong default could be fixed by editing a rule or a value inside a feature that is already planned, it is Tier B.

| Tier | Which points | How the user sees it | Status before the decision |
|---|---|---|---|
| A | Changes what is built: adds or removes a feature, a role, an integration or a platform, changes what data is kept, narrows an accepted requirement, comes only from a prototype, or is a requirement with status Unclear or Proposed | Needs the user's answer. Presented with options and a recommendation. | Pending decision |
| B | Fills a gap inside a planned feature with a recommended default: a rule, a limit, a value, a display choice, a parked item or an exclusion for something no accepted requirement asks for | Listed in one compact table with the recommended treatment. The user accepts the whole group with one action, or flags items. | Proposed default |
| C | A technical detail inside an accepted requirement, with no effect on what users see, what is kept, or what the client must live with | Not shown for decision. Logged. | Logged |

After the user decides, the status is Decided and the resulting treatment is filled: In scope, Assumed, Parked (with the PK ID), Excluded, Dropped, or Left to development team.

Rules:
- Between A and B, apply the test above. Do not move a point to A only because it is a business rule. A default rule inside a planned feature, such as "requests with a start date in the past are rejected", is Tier B.
- Group related points. One point per decision, not one per feature. For example, all questions about who can do what are one point, owned by the roles feature.
- Quality over count. Do not list a point that no feature needs. Do not list obvious technical detail as Tier C. List a Tier C point only if you would otherwise have written it in the cell.
- More than about ten Tier A points in one module usually means the tiering is too strict. Re-check each against the test and group related ones before returning.
- Parked or excluded items: if no accepted requirement mentions the point, it is Tier B with the recommended treatment Parked or Excluded. It is Tier A when the point is a normal part of the capability an accepted requirement describes, so that a reader of the requirement would expect it. Excluding it would narrow the requirement. Test: would a reader of the requirement be surprised to find this left out?
- Data kept: a default of "records are kept and there is no deletion function" is Tier B. A stated retention period, an archive or a deletion function is Tier A.
- The status follows the tier, not the treatment. A Tier B point proposed as Parked or Excluded has status Proposed default.
- The Parked list entry and its PK ID are created when the row is Decided as Parked, by the Writer. The scan does not create Parked entries.
- The user may apply an earlier decision to a type of point. The Orchestrator records it in the register under Precedents. Later points of the same type are decided by precedent and reported in the review summary.
- A point found late (by a reviewer or the Writer, after the first scan) becomes a Decisions row with status Pending decision if it is Tier A, or Proposed default if it is Tier B. A Tier A behaviour is not drafted until the user decides. Late points are raised at the next module review, not as a separate interruption.
- A requirement in the baseline with status Unclear or Proposed is a Tier A point. It is not drafted until decided.

## No implied authority
- **No business rule from technical convention.** Do not justify a business rule because it is standard practice. Examples: automatic retries, duplicate suppression, permanent rejection, retention periods, conflict-resolution rules. If it is internal mechanics inside an accepted requirement, it is Tier C and is not presented as client-approved. If it affects what users see, what is kept or what the client must live with, it is Tier A or B.
- **No promotion from prototype.** Functionality seen only in a prototype has requirement status `Proposed`. It stays out of the baseline and the WBS until the user accepts it.
- **No authority from reviewers.** A reviewer may name a missing behaviour and give options. A reviewer cannot tell the Writer to choose a business rule. The comment status is `Needs decision`, not `Resolved`, until the user decides.
- **No silent exclusion.** Do not remove or narrow an accepted requirement by writing an assumption or an exclusion. Example: "Reopening a rejected request is not included" is a scope decision if the accepted requirements do not set that boundary. It is a Tier A point.
- **No silent default.** Every assumption has a Decisions row. A default that the user has not accepted has status Proposed default and is listed for acceptance. It is not final until the row is Decided.

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
3. Every parked item appears in the Parked list with its source feature and reason, and has a Decisions row.
4. Every assumption that needs the client has a Queries for Client entry, and every query has an assumption.
5. Exclusions do not conflict with other features.
6. The `Assumptions:` block states exclusions, not only assumptions.
7. A feature with no assumptions has a stated reason.
8. Every assumption in a cell has a Decisions row, and the row is Decided when the module is approved. No `[PENDING` line remains at approval.
9. No assumption or exclusion narrows an accepted requirement.
10. No technical convention is written as a business rule. No prototype-only function is written as scope.

Comment severity:
- **Must fix:** an unclear point is written as a fact, scope is implied without a source, a parked item is missing from the Parked list, an assumption has no Decisions row, an accepted requirement is narrowed, a technical convention is written as a business rule, or a prototype-only function is written as scope.
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
- If the user cannot answer now: the user decides to park it. Then "Parked for next phase: reports." and an exclusion "Export of reports to a file is not included." Until then the point is Pending decision.

**Case 5: a feature has no unclear points.**
- It still states what is excluded, for example "Printing is not included." If nothing applies, the review notes why there is no Assumptions content.
