# Development Workflow Rules

## Session Management
- Always start sessions by reading Memory Bank files
- Summarize current project state and next steps
- Update Memory Bank after significant changes or discoveries
- Use Plan Mode for strategy and Act Mode for implementation

## Code Changes Workflow
1. **Before Making Changes**
   - Read relevant Memory Bank files
   - Understand current architecture and patterns
   - Identify affected modules and dependencies
   - Plan the implementation approach

2. **During Implementation**
   - Follow existing code patterns and conventions
   - Write clean, self-documenting code with meaningful names
   - Remove redundant comments and dead code
   - Update tests alongside code changes
   - Document significant decisions in Memory Bank
   - Run relevant tests frequently

3. **After Implementation**
   - Review code for unnecessary comments and cleanup opportunities
   - Run full test suite for affected modules
   - Update Memory Bank with new patterns or learnings
   - Document any architectural changes
   - Verify integration test compatibility

## Memory Bank Maintenance
- Document new patterns in `systemPatterns.md`
- Add technical details to `techContext.md` when needed
- Update feature files with current progress and status
- Track work context in relevant feature-specific files

## Build and Test Cycle
- Use `./gradlew build` for full project build
- Run module-specific tests during development
- Execute integration tests for cross-module changes
- Monitor test execution time and optimize as needed

## Documentation Updates
- Update inline JavaDoc for new public methods
- Maintain README files for significant changes
- Document new PPL commands and SQL functions
- Keep Memory Bank files current and accurate

## Git and Version Control
- Commit frequently with meaningful messages
- Include test updates with code changes
- Document breaking changes in commit messages
- Consider backward compatibility impact

## Performance Considerations
- Profile critical paths during development
- Monitor memory usage for large operations
- Optimize database queries and indexing
- Consider caching strategies for expensive operations

## Error Handling and Debugging
- Use appropriate logging levels
- Provide meaningful error messages
- Handle edge cases gracefully
- Document known limitations and workarounds
