# Feature Investigation Files

Feature files preserve investigation results and design decisions for OpenSearch SQL features.

## Purpose
- Restart feature development with full context
- Preserve design rationale and trade-offs
- Document technical discoveries
- Reuse implementation patterns

## File Naming
- `[feature-name].md` (e.g., `earliest-latest-aggregates.md`)
- Use lowercase with hyphens
- Include component when relevant (e.g., `ppl-stats-functions.md`)

## Template Structure

```markdown
# Feature: [Feature Name]

## Investigation Summary
### Problem Analysis
[What problem and pain points?]

### Requirements Discovery
[Core requirements and constraints]

### User Impact
[Who benefits and how?]

## Technical Investigation
### Architecture Analysis
[How it fits into existing system]

### Implementation Approaches Considered
1. **Approach 1**: [Description]
   - **Pros**: [Benefits]
   - **Cons**: [Drawbacks]
   - **Complexity**: [High/Medium/Low]

### Technical Constraints
[Limitations and dependencies]

## Design Decisions
### Chosen Approach
**Decision**: [Selected approach]
**Rationale**: [Why chosen]

### Key Design Choices
- **Choice**: [Decision] - **Reasoning**: [Why] - **Trade-offs**: [What gained/lost]

## Implementation Strategy
### High-Level Plan
[Implementation approach with phases]

### Module Impact
- **Core**: [Impact]
- **PPL**: [Impact]
- **SQL**: [Impact]
- **OpenSearch**: [Impact]

### Risk Assessment
[Main risks and mitigation]

## Knowledge Gained
### Codebase Insights
[What learned about existing code]

### Technical Discoveries
[New patterns or insights]

## Current Status
- [ ] Investigation complete
- [ ] Implementation in progress
- [ ] Testing complete
- [ ] Production ready

---
**Investigation Date**: [YYYY-MM-DD]
**Last Updated**: [YYYY-MM-DD]
```

## Best Practices
- Document all approaches (even rejected ones)
- Include code examples and metrics
- Always explain **why** behind decisions
- Use checkboxes for progress tracking
- Update regularly during development

## Integration
Feature files auto-load when:
- Feature name mentioned
- Working on related code
- Starting previously investigated feature
