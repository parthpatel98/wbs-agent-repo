---
name: wbs-format
description: The fixed WBS format. Columns, row types, IDs, the structure of the Comments / Details cell, rules for Queries for Client, and the markdown module file layout that maps to the sheet. Use whenever WBS rows are written, reviewed or published.
---

# WBS format

The format follows the reference WBS sheet. It is fixed. Do not add, remove, rename or reorder columns, and do not change the row types or the structure of the details text.

## When to use
- The WBS Writer, when writing or correcting a module.
- The QA Reviewer and Product Owner Reviewer, when checking format.
- The Publisher, when mapping a module file to the sheet.
- The WBS Architect, when planning IDs and modules.

## Sheet layout
One tab named `WBS`. The header row is frozen. Seven columns in this order:

| Column | Name | Content | Filled by |
|---|---|---|---|
| A | # | Hierarchical ID, stored as text | Agents |
| B | Module | Module name, repeated on every feature row | Agents |
| C | Sub-Module | Grouping label for related features | Agents |
| D | Features | Short feature name | Agents |
| E | Comments / Details | Main description | Agents |
| F | Queries for Client | Points the client must confirm or provide. Empty when none. | Agents |
| G | Developer Comments | Reserved for the development team | Development team. Left empty. |

## Row types and IDs
- **Module header row.** One per module, merged across A to G. Text: `<n>. <Module name>`. Add `  |  <audience>` (two spaces, a bar, two spaces) only where the module is meant for a defined group of users.
- **Feature row.** One per feature. ID is `<module no.>.<feature no.>`, for example `1.1`. Numbering restarts in each module.
- **Sub-feature row.** ID has a third level, for example `6.2.1`. Use it only when a feature has distinct parts that need their own row. The parent row stays and introduces the parts, and each part carries its own details.
- Sub-Module (column C) is a label, not an ID level. Several features may share one label. The same label is spelled the same way every time.
- IDs are text. `1.10` must not become `1.1`. Sort in natural order: 1.2 before 1.10, and 6.2 then 6.2.1 before 6.3.
- IDs are not reused after a feature is removed.

## Comments / Details cell

### Order of parts
1. **Introduction.** One to three sentences. What the feature covers and who uses it.
2. **Body.** Bullets, with optional topic headings or group labels.
3. **Assumptions block.** Always last.

### Exact characters
- Bullet: `•` (U+2022) followed by one space.
- Nested bullet: two spaces, a hyphen, one space (`  - `).
- One blank line between the introduction and the first bullet, between topic groups, and before `Assumptions:`.
- Plain text only. No markdown symbols, bold, italics, tables, numbered lists or `#` headings inside the cell.
- The label `Assumptions:` is spelled exactly like this, with the colon, on its own line.

### Topic headings
Use a topic heading only when the feature covers several separate capabilities.
- A plain text line in title case, no colon, with a blank line before it.
- Followed by one introductory sentence, then bullets.
- Do not use a topic heading in a feature that covers one capability.

### Group labels
A short label line ending with a colon, for example `Rules:` or `Extracted information:`, may introduce a bullet group inside a topic. It is plain text and is followed by bullets.

### Label bullets
A bullet may start with a short label and a colon, for example `• Header: ...`. Use them where bullets describe parts of one screen or object. Do not mix labelled and unlabelled bullets in the same list.

### Assumptions block
- Appears once, at the end of the cell, even when the cell has several topic headings.
- Holds assumptions, exclusions and items parked for the next phase, as `•` bullets. Wording is set in the boundary-setting skill.
- A feature with nothing to assume or exclude still needs a reason, given in the review.

### Length
The reference cells run from about 1,000 to 4,500 characters. If a cell passes 5,000 characters, consider splitting the feature. The sheet cell limit is 50,000 characters.

## Queries for Client
- Holds points the client must confirm or provide for this feature.
- One query per line. Start with the party and the action, for example `Client to provide ...` or `Confirm ...`.
- If there is more than one query, start each line with `•`.
- Every query matches an assumption in the Comments / Details cell of the same feature.
- Empty in the sheet when there are none. Written as `None` in the module file.

## Developer Comments
Never written by agents. Left empty in the sheet. It is not in the module file.

## Module file (markdown)
The module file holds the cell text exactly as it will appear in the sheet.

```
---
module: <n>. <Module name>
status: draft | in review | user review | approved
version: 0.1
baseline: <version>
---

## <n>. <Module name>[  |  <audience>]

### <ID>
- Module: <module name>
- Sub-Module: <label>
- Feature: <feature name>

#### Comments / Details
<cell text>

#### Queries for Client
<cell text or None>

## Review Log

## Change Log
```

- One `### <ID>` block per feature or sub-feature, in blueprint order.
- The module header line is the first `##` heading. `## Review Log` and `## Change Log` follow the last feature block.
- Cell text has no blank lines at its start or end.

## Worked example
Adapted from the reference. It shows the order of parts, the characters and the Assumptions block.

```
### 1.4
- Module: Common Application Features
- Sub-Module: Language
- Feature: English and Swedish Interface

#### Comments / Details
Users can use the application in English or Swedish. The selected language applies to the application interface, not to business content or user inputs.

• Language Selection: Users should be able to select English or Swedish in their language preference.
• Interface Language: Menus, headings, labels, buttons, standard statuses, system messages and validation messages should be displayed in the selected language.
• Saved Preference: The application should remember each user's selected language.
• Content Preservation: Changing the language should not translate or alter the content of records, customer data or attachments.

Assumptions:
• English and Swedish are the only supported interface languages.
• Automatic translation of customer emails, attachments, manually entered text and extracted information is excluded.

#### Queries for Client
None
```

## Checks before a row is accepted
- [ ] ID is text, unique, in natural order, and matches the blueprint.
- [ ] Module, Sub-Module and Feature match the blueprint.
- [ ] Introduction is one to three sentences.
- [ ] Bullets use `•` and nested bullets use `  - `.
- [ ] No markdown formatting inside the cell.
- [ ] Topic headings are used only for multi-capability features.
- [ ] `Assumptions:` is present, spelled exactly, and appears once at the end.
- [ ] Every query has a matching assumption.
- [ ] Developer Comments is not written.

## Common mistakes
- Hyphen or asterisk bullets instead of `•`.
- Bold text or `#` headings inside the cell.
- IDs written as numbers.
- Assumptions placed in the middle of the cell, or repeated under each topic heading.
- "Assumption:" instead of "Assumptions:".
- A topic heading on a feature with one capability.
- A query with no matching assumption, or an assumption that needs the client but has no query.
- The Sub-Module label spelled two ways.
