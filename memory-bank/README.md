# Memory Bank Documentation

This directory contains the core Memory Bank files that provide persistent context and knowledge for the OpenSearch SQL plugin project development.

## Directory Structure

### Core Files
- **`projectbrief.md`** - Project foundation, scope, and high-level requirements
- **`productContext.md`** - Product goals, user experience, and business context
- **`systemPatterns.md`** - Architecture decisions, design patterns, and coding conventions
- **`techContext.md`** - Technical setup, dependencies, and infrastructure details
- **`codeReview.md`** - Code review rubric and quality standards

### Specialized Directories

#### `opensearch-specific/`
OpenSearch-specialized documentation including:
- **`calcite-integration.md`** - Calcite integration patterns and best practices
- **`module-architecture.md`** - Module organization and architectural patterns
- **`ppl-parser-patterns.md`** - PPL parser implementation guidelines

#### `demo/`
Demo script templates and documentation patterns for creating comprehensive OpenSearch PPL function demonstrations:
- **`demo-script-template.md`** - Standardized template for creating PPL function demo scripts

#### `features/`
Feature investigation and documentation system for tracking development progress and decisions on specific features.
Files under this directory is ignored by Git.

#### `temporal/`
Temporal context files for session-specific information and temporary development notes.
Files under this directory is ignored by Git.

## Usage Guidelines

### For Developers
- Read core files before starting development sessions
- Update relevant files when making architectural decisions
- Document new patterns in `systemPatterns.md`
- Add technical discoveries to `techContext.md`

### For Cline (AI Assistant)
- Automatically read all Memory Bank files at session start
- Reference appropriate files during development tasks
- Follow established patterns and conventions
- Update Memory Bank files with new learnings and patterns

## File Maintenance

### When to Update
- **After architectural changes**: Update `systemPatterns.md`
- **New dependencies or tools**: Update `techContext.md`
- **Feature completion**: Update relevant feature files
- **Process improvements**: Update workflow files
- **Code review insights**: Update `codeReview.md`

### Best Practices
- Keep files concise but comprehensive
- Use clear, actionable language
- Include specific examples and code patterns
- Maintain consistency across all Memory Bank files
- Regular review and cleanup of outdated information

This Memory Bank system ensures consistent, informed development practices across all sessions and team members.
