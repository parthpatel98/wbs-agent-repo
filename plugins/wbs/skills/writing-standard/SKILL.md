---
name: writing-standard
description: The writing rules for all WBS text. Short, formal, factual, plain wording, with a list of words to avoid, the use of "should", terminology and cross-reference rules, and before and after examples. Use whenever WBS text is written, corrected or reviewed.
---

# Writing standard

WBS text is read by clients, project managers and developers. It must be clear, formal and short. It sits on top of the fixed cell structure in the wbs-format skill.

## When to use
- The WBS Writer, before and while drafting, and again before returning.
- The QA Reviewer, when checking section 6 of its checks.
- The Product Owner Reviewer, when checking clarity.

## Principles
1. **Formal and factual.** State what the feature does. Do not describe how good it is.
2. **Short.** One behaviour per bullet. If a bullet needs "and" to join two different behaviours, split it.
3. **Plain.** Use common words. Do not use words that sound like marketing or a technology announcement.
4. **Specific.** Use values, limits and names where they are known. If they are not known, write an assumption and add a query. Never fill in a value from imagination.
5. **Human.** Read like a careful colleague wrote it. Vary the subject of sentences (the user, an Admin, the application) and avoid the same sentence pattern in every bullet.
6. **Consistent.** One term for one thing, the same way everywhere.

## Sentence rules
- **Introduction:** one to three sentences. What the feature covers and who uses it. No history, no benefits language.
- **Bullets:** about 25 words or fewer. Split longer ones.
- **Mood:**
  - Introduction: present tense, for example "Users can reset their own password by email."
  - Capability: "Users should be able to ..."
  - System behaviour: "The application should ..."
  - Fixed fact or rule: present tense, for example "Each Case has one status."
  - Assumptions and exclusions: plain statements in present tense, for example "Export to Excel is not included." Use "will" only for a future action by a named party, for example "The client will provide the password policy." Do not use "should".
- **Modal verb:** use "should" for behaviour. Do not mix in "will", "shall" or "must" for the same kind of statement. Use "must" only for a mandatory rule that is stated as a rule, for example a required field.
- **Voice:** active. Name who or what acts.
- **Tense of events:** describe the result, for example "The sent message appears in the thread."
- **Negatives:** state them plainly and where they matter. "Adding a comment does not send an email to the customer."
- **Numbers:** write the number and the unit. "24 hours", not "a day or so". State the time zone where times matter.
- **UI labels:** write them as they appear on screen, with the same capital letters, for example the "Forgot password" link.
- **Defined terms:** capitalise as the glossary does. Do not capitalise ordinary words.
- **Cross-references:** write the feature ID in brackets, for example "(Feature 1.2)". The ID must exist in the blueprint.
- **People:** write roles, never personal names.
- **Lists:** do not write "etc.", "and so on" or "and more". List the items, or say "the following".

## Words and phrases to avoid
Replace or delete them.

| Avoid | Use instead |
|---|---|
| seamless, seamlessly | (delete) |
| robust, powerful, cutting-edge, state-of-the-art, best-in-class | (delete) |
| intuitive, user-friendly, easy to use | describe the behaviour |
| leverage, utilise | use |
| empower, enable (as a vague verb) | "allow" or name the action |
| streamline, optimise (without a measure) | state the change |
| comprehensive, holistic, end-to-end (as decoration) | state what is covered |
| enhance, improve (without a measure) | state the change |
| ensure (overused) | "make sure", or state the rule |
| in order to | to |
| it is important to note that, please note | (delete) |
| furthermore, moreover, additionally, in addition | start a new bullet, or use "and" |
| various, several, numerous | the number, or the list |
| as needed, as appropriate, if required, where applicable | state the condition |
| etc., and so on | list the items |
| intelligent, smart, magic, AI-powered (as a selling word) | describe what it does |
| delve, landscape, journey, ecosystem, game-changing | (delete) |

If the project itself is about AI, the word "AI" is allowed as a product term, for example "AI classification". It is not allowed as praise.

## Style points that make text read as written by a person
- Do not start every bullet with the same words.
- Do not use three-part lists for effect. List the real items, however many there are.
- Do not use "not only ... but also" or similar balanced constructions.
- Avoid long chains of commas and clauses. Split the sentence.
- Do not use exclamation marks, emojis, rhetorical questions or decorative punctuation.
- Use few dashes. Prefer full stops and commas.
- Do not repeat the feature name in every bullet.
- Do not restate the introduction as a bullet.

## Before and after

**1. Marketing wording**
- Not acceptable: The platform provides a seamless, intelligent experience for managing orders.
- Acceptable: Users can create, view and edit orders.

**2. Vague condition**
- Not acceptable: Notifications are sent as needed.
- Acceptable: A notification is sent when a task is assigned to a user. The timing of due-date reminders is to be confirmed.

**3. Two behaviours in one bullet**
- Not acceptable: • Users should be able to search and export the list and receive an email with the file.
- Acceptable:
  • Users should be able to search the list by name.
  • Users should be able to export the list to a file.
  Assumptions:
  • Sending the exported file by email is not included.

**4. Filler connector**
- Not acceptable: Furthermore, it is important to note that the user can additionally filter by date.
- Acceptable: Users can also filter by date.

**5. Unstated value**
- Not acceptable: Links expire after a short time.
- Acceptable: Reset links expire after 24 hours.

**6. Person named in a requirement**
- Not acceptable: A failure email is sent to Daniel.
- Acceptable: A failure email is sent to the recipient configured by an Admin.

**7. Repeated sentence pattern**
- Not acceptable: • The system should display the name. • The system should display the date. • The system should display the status.
- Acceptable: • Each row should show the name, date and status.

## Self-edit checklist
- [ ] Every bullet has one behaviour and about 25 words or fewer.
- [ ] No word from the avoid list.
- [ ] "should" is used for behaviour. No mixed modal verbs.
- [ ] No "etc." or "as needed".
- [ ] Every value is a stated number, or it is an assumption with a query.
- [ ] Terms match the glossary. No two words for one thing.
- [ ] Cross-references use IDs that exist.
- [ ] No personal names, estimates or praise.
- [ ] Reads naturally aloud.
