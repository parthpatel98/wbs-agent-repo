---
name: wbs
description: Starts or resumes a WBS project. Shortcut for the WBS plugin's start command.
argument-hint: "[project name]"
disable-model-invocation: true
---

Run the `wbs:start` skill now with the Skill tool, and pass this argument through: $ARGUMENTS

If the skill is not found, tell the user the WBS plugin is not installed and give these commands:

/plugin marketplace add <owner>/wbs-agents
/plugin install wbs@wbs-agents
