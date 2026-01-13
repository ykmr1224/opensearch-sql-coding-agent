# Memory Bank System

Memory resets between sessions. Memory Bank provides complete project context and must be read at start of every session.

**Location**: Memory Bank files are stored under `{memorybank-dir}` = `memory-bank/` (linked from project root)

## Core Files (Required)
All core files are located under `{memorybank-dir}`:
1. `{memorybank-dir}/projectbrief.md` - Foundation, requirements, scope
2. `{memorybank-dir}/productContext.md` - Purpose, problems solved, user goals
3. `{memorybank-dir}/systemPatterns.md` - Architecture, design patterns, relationships
4. `{memorybank-dir}/techContext.md` - Technologies, setup, dependencies

## Feature Files
Feature files are stored in `{memorybank-dir}/features/`:
- `{memorybank-dir}/features/[feature-name].md` - Feature investigations

Check `{memorybank-dir}/features/README.md` for further guidance.

## Temporal Notes
Temporal files are stored in `{memorybank-dir}/temporal/`:
- `{memorybank-dir}/temporal/debug-[issue].md` - Debugging notes
- `{memorybank-dir}/temporal/scratch-[topic].md` - Quick notes

Temporary workspace for session notes and debugging.

## Workflows

### Plan Mode
1. Read Memory Bank → 2. Check completeness → 3. Develop strategy → 4. Present approach

### Act Mode
1. Read Memory Bank → 2. Update documentation → 3. Execute task → 4. Document changes

## Session Start Protocol
**CRITICAL**: Always start by reading ALL memory bank files to understand project state, then:
1. Summarize key findings and current context from core files
2. Identify next steps from relevant feature files
3. Read specific feature files when mentioned or referenced
4. Proceed with task using this context

## Documentation Guidelines
**Keep memory bank notes simple and concise:**
- Focus on essential information only
- Avoid verbose explanations
- Use bullet points and short sentences
- Omit less important details to minimize token usage
- Prioritize actionable insights over comprehensive documentation

## Updates
Update Memory Bank when:
- Discovering new project patterns
- Starting working on new feature
- After significant changes
- User requests "update memory bank"
- Context needs clarification
- Made progress on a feature

## Current Work Context
Current work context and status should be maintained in the relevant feature files:
- **Active features**: Update status in corresponding feature files
- **Implementation progress**: Document in the specific feature file being worked on
- **Next steps**: Include in the feature file's current status section
- **Recent changes**: Update the feature file with latest developments

This approach ensures all context is preserved in feature-specific files rather than separate tracking files.
