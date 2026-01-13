# Token Optimization Guidelines

Guidelines for creating concise, token-efficient documentation while preserving essential information.

## Core Principles
- **Essential Only**: Include only information needed for understanding or action
- **Bullet Points**: Use lists instead of paragraphs where possible
- **Remove Redundancy**: Eliminate repeated explanations or marketing language
- **Concise Headers**: Use short, descriptive section titles
- **Action-Oriented**: Focus on what to do, not why it's important

## Content Reduction Strategies

### Remove These Elements
- Marketing language ("powerful", "comprehensive", "robust")
- Redundant explanations of obvious concepts
- Verbose introductions and conclusions
- Detailed examples when simple ones suffice
- Step-by-step explanations of standard processes

### Keep These Elements
- Essential technical details
- Required parameters and configurations
- Error conditions and troubleshooting
- Code examples (but keep them minimal)
- Decision rationale (the "why" behind choices)

## Template Optimization

### Before (Verbose)
```markdown
## Comprehensive Overview and Detailed Analysis

This section provides a thorough and comprehensive analysis of the feature implementation, including detailed explanations of the architectural decisions, comprehensive coverage of all possible use cases, and extensive documentation of the various approaches that were considered during the investigation phase.

### Detailed Implementation Strategy with Multiple Phases

The implementation will be carried out in multiple carefully planned phases:

1. **Phase 1 - Initial Setup and Configuration**: During this phase, we will...
```

### After (Concise)
```markdown
## Implementation

### Strategy
1. **Setup**: Configure components
2. **Core Logic**: Implement main functionality  
3. **Testing**: Validate implementation
```

## File Structure Optimization
- Use 2-3 levels of headers maximum
- Combine related sections
- Use tables for structured data
- Prefer inline code over code blocks for simple examples

## Measurement
- Target 50-80% reduction in token count
- Preserve all essential technical information
- Maintain readability and usability
