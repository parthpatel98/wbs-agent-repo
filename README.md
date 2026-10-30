# WBS Agents

A Claude Code plugin that produces a reviewed Work Breakdown Structure (WBS), module by module, from requirement material, and publishes approved modules to a Google Sheet in a fixed format.

## What it does

1. Guided setup: a few selectable questions about the material, the output and the reviews.
2. Requirements: the inputs (brief, documents, notes, prototype code) are read and turned into numbered requirements per module. An Advisor raises gaps, risks and suggestions. A Completeness Reviewer checks each module and lists open questions. The user answers and approves a baseline.
3. Blueprint: modules, features, IDs and requirement coverage are planned and approved.
4. Module loop: for each module the Writer drafts the WBS in markdown, a QA Reviewer and a Product Owner Reviewer review it, the user reviews and decides, and the module is approved.
5. Whole-WBS check, then publishing to the project's copy of the reference sheet, then clean-up of working files.

Anything unclear or unconfirmed is recorded as an assumption, an exclusion or an item parked for the next phase. It is never written as a fact.

## Install

In Claude Code:

```
/plugin marketplace add <owner>/wbs-agents
/plugin install wbs@wbs-agents
```

Or run `install.sh` (macOS, Linux) or `install.ps1` (Windows PowerShell). Both also add a short `/wbs` command.

## Use

Open Claude Code in an empty folder for the project and run:

```
/wbs:start
```

or `/wbs` if the short command was installed. If the folder already holds a `project-profile.md`, the process resumes where it stopped.

## Requirements

- Claude Code.
- Google Drive and Google Sheets connected in Claude Code, for the sheet copy and publishing. Without them the process still runs and produces markdown only.
- The reference WBS sheet. The format of the sheet is fixed: tab `WBS`, columns `#`, `Module`, `Sub-Module`, `Features`, `Comments / Details`, `Queries for Client`, `Developer Comments`.

## Files

- `plugins/wbs/skills/start`: the Orchestrator (the start command) and the templates.
- `plugins/wbs/agents`: Requirements Analyst, Advisor, Completeness Reviewer, WBS Architect, WBS Writer, QA Reviewer, Product Owner Reviewer, Publisher.
- `plugins/wbs/skills`: the format, writing, boundary, review, design and publishing rules the agents load.

## Notes

- The Publisher's tool list names the Google Sheets and Drive tools. If the connector tools have other names in your setup, update the `tools` line in `plugins/wbs/agents/publisher.md`.
- Plugin agents do not take their own MCP server or permission settings. Set these in the project or user settings.
