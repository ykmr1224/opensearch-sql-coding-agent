# OpenSearch SQL Project Specific Rules

## Project Structure
- Follow existing module structure:
  - `core/` - Core SQL/PPL functionality and shared components
  - `ppl/` - PPL (Piped Processing Language) specific implementation
  - `sql/` - SQL specific implementation
  - `opensearch/` - OpenSearch storage engine integration
  - `integ-test/` - Integration tests
  - `plugin/` - OpenSearch plugin packaging
  - `common/` - Shared utilities and common code

## PPL Parser Development
- When modifying ANTLR grammar files (`.g4`):
  - Update both lexer and parser grammar files as needed
  - Regenerate parser classes after grammar changes
  - Update corresponding AST builder classes
  - Add comprehensive test cases for new grammar rules
- PPL command implementation pattern:
  - Create AST node in `core/src/main/java/org/opensearch/sql/ast/tree/`
  - Implement logical plan in appropriate module
  - Add physical plan implementation
  - Create comprehensive unit and integration tests

## Calcite Integration
- When working with Apache Calcite integration:
  - Follow existing patterns in `CalciteRelNodeVisitor` and `CalciteRexNodeVisitor`
  - Maintain compatibility with Calcite version constraints
  - Test SQL generation and optimization paths
  - Document any Calcite-specific workarounds or limitations

## Function Implementation
- New function implementations:
  - Add to `BuiltinFunctionName` enum
  - Implement in appropriate function table (`PPLFuncImpTable`, etc.)
  - Create comprehensive test coverage
  - Document function behavior and limitations
  - Consider both SQL and PPL compatibility

## Testing Requirements
- Unit tests for all new functionality
- Integration tests for end-to-end scenarios
- Parser tests for grammar changes
- Calcite integration tests for query planning
- Performance tests for critical paths

## Build and Development
- Use Gradle for build management
- Follow existing module dependencies
- Run `./gradlew build` before committing
- Use `./gradlew :module:test` for module-specific testing
- Integration tests: `./gradlew :integ-test:integTest`

## Backward Compatibility
- Maintain API compatibility for public interfaces
- Document breaking changes in release notes
- Provide migration paths for deprecated functionality
- Consider impact on existing OpenSearch installations

## Documentation
- Update relevant documentation in `docs/` directory
- Maintain inline code documentation
- Update README files for significant changes
- Document new PPL commands and SQL functions
