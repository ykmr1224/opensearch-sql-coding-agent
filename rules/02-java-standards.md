# Java Development Standards

## JDK Requirements
- **JDK 21**: Required for development and runtime
- **SDKMAN**: Recommended tool for JDK version management
- **Compatibility**: Maintain compatibility with Java 11 whenever possible for OpenSearch 2.x compatibility


### Quick SDKMAN Setup
```bash
sdk install java 21.0.8-amzn
sdk default java 21.0.8-amzn
java -version  # Verify JDK 21 is active
```

## Code Style & Formatting
- Follow Java naming conventions:
  - Classes: PascalCase (e.g., `QueryExecutor`, `PPLParser`)
  - Methods/Variables: camelCase (e.g., `executeQuery`, `parseExpression`)
  - Constants: UPPER_SNAKE_CASE (e.g., `MAX_RETRY_COUNT`)
  - Packages: lowercase with dots (e.g., `org.opensearch.sql.ppl`)
- Use proper JavaDoc comments for public methods and classes
- Write self descriptive code with only necessary comments (avoid redundant comment)
- Maintain consistent indentation (4 spaces, no tabs)
- Keep line length under 120 characters
- Use meaningful variable and method names that express intent

## Clean Code Principles
- **Avoid redundant comments**: Code should be self-explanatory through clear naming
- **Remove obvious comments**: Don't comment what the code clearly shows
- **Focus on WHY, not WHAT**: Comments should explain reasoning, not mechanics
- **Keep methods concise**: Single responsibility, typically under 20 lines
- **Eliminate dead code**: Remove unused imports, variables, and methods
- **Use descriptive names**: Prefer `calculateTotalPrice()` over `calc()` with comments

## Documentation Requirements
- All public classes must have JavaDoc with class purpose
- All public methods must have JavaDoc with:
  - Brief description of what the method does
  - @param descriptions for all parameters
  - @return description if method returns a value
  - @throws for any checked exceptions
- Complex algorithms should have inline comments explaining the logic
- Update relevant documentation when modifying existing functionality

## Error Handling
- Use specific exception types rather than generic Exception
- Always provide meaningful error messages
- Log errors at appropriate levels (ERROR, WARN, INFO, DEBUG)
- Handle null values explicitly - prefer Optional<T> for nullable returns
- Use try-with-resources for resource management

## Code Organization
- Keep classes focused on single responsibility
- Prefer composition over inheritance
- Use interfaces to define contracts
- Group related functionality into packages
- Separate concerns: parsing, execution, storage, etc.

## Performance Considerations
- Avoid creating unnecessary objects in loops
- Use StringBuilder for string concatenation in loops
- Consider lazy initialization for expensive operations
- Profile code when performance is critical
- Use appropriate data structures for the use case

## Security Guidelines
- Validate all inputs, especially user-provided queries
- Sanitize data before logging to prevent log injection
- Use parameterized queries to prevent SQL injection
- Be cautious with reflection and dynamic class loading
- Follow principle of least privilege for permissions
