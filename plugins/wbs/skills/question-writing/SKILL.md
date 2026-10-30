---
name: question-writing
description: How to ask the user questions in the WBS process. Covers when to ask, how to batch and phrase questions, how to give a recommended answer, when to use selectable options, and how to record answers. Use whenever an agent or the Orchestrator needs information from the user.
---

# Question writing

Questions cost the user time. Ask only what is needed, once, in a form that is quick to answer. The process is guided, but not every step is a question.

## When to use
- Orchestrator, at setup and at each checkpoint.
- Any agent that reports a question in its return summary. The Orchestrator turns it into a question using this skill.

## When to ask
Ask when:
- The answer changes the scope: a feature, role, integration, migration or way of working (see boundary-setting, step 2).
- Two sources conflict and the correct one cannot be found.
- A choice belongs to the user: order of modules, review rounds, approval, publishing.
- Required information is missing and not in the inputs or the knowledge bank.

Do not ask when:
- The answer is in the inputs or the knowledge bank. Search first and state where it was found.
- A sensible default fits this phase. Record it as an assumption and, if the client must confirm it, a query for the client.
- The point is a wording or format choice that the standards decide.
- The question was already answered. Check `requirements/register.md` first.

## Where the answer goes if the user cannot give it
- Not needed to proceed: assumption, with a query for the client.
- Useful but not for this phase: parked.
- Blocks the work: say so, and continue with the other modules.

## Setup questions
- Use selectable options for material available, location, knowledge bank, kind of work, output destination, publish timing and review choice.
- Use multi-select where more than one answer applies.
- Use plain text only for items that cannot be selected: names, roles, legacy systems, terms, language, links.
- Do not ask for what the attachments already show.

## Batching
- Collect all gaps from a step and ask them together, grouped by module or topic.
- Number the questions. Keep to ten or fewer in one batch. If there are more, ask the ones that block most work first.
- Ask at the defined checkpoints only. Do not interrupt between checkpoints for a minor point.

## Phrasing
- One question asks one thing.
- Start with what is known and the reason the answer matters, in one sentence. Then the question.
- Use the terms of the project glossary.
- Use plain, formal language. No jargon.
- Avoid questions that can be answered yes or no when a choice or a value is needed.

## Recommended answer
Every question carries a recommended answer, marked as the recommendation, with a short reason. Put it first in the list of options. Base it on the inputs, the knowledge bank or common practice. If there is no basis, say so and do not invent one.

## Selectable options
- Two to four options. Each is distinct and complete.
- Add a one-line effect for an option only if the label is not clear alone.
- The user can always type another answer.

## Question list format (text questions)
```
1. <Module or topic> | <Feature ID if any>
   Context: <what is known, with source>
   Question: <one question>
   Recommended: <answer> (<reason>)
   If not answered: <how the point will be treated: assumption, parked or excluded>
```

## Decision sheet
The Orchestrator collects the open points of a phase into one decision sheet, so the user decides once. The sheet follows the tiers in the boundary-setting skill.

- **Tier A:** each point is a question with options and a recommended answer. Use AskUserQuestion, up to four questions in one call. If there are more than four, ask the highest impact first, then the rest in the next call of the same sheet.
- **Tier B:** show one compact table: ID, feature, assumption, recommended treatment. Then ask one question with three options: **Accept all recommended** (recommended), **Accept all except the ones I list**, **Show each item**. One action decides the whole group.
- **Tier C:** not shown. State the count and where it is logged.
- **Precedents:** list the points decided by an earlier precedent, with the precedent ID. They are not asked again.

After the user answers, record every decision in the Decisions table of `requirements/register.md` with its resulting treatment, status Decided and the date. If the user's answer is a general rule, ask once whether to apply it to later points of the same type, and record it under Precedents.

## Recording answers
- Record each answer in `requirements/register.md` with the question, the answer, the date and the feature IDs affected.
- An answer from the user is a confirmed requirement. Mark the source as "User answer" with the date.
- Answers given in the module review are recorded in the Review Log, under Responses and Decisions.
- Do not keep decisions only in the conversation.

## After the answers
- Update the affected files in the next agent run.
- Do not ask again for a point that has been answered. If an answer conflicts with the sources, show both and ask once.
