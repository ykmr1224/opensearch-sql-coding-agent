# Testing Requirements

## Test Coverage Standards
- Unit tests required for all new business logic
- Integration tests for end-to-end scenarios
- Parser tests for grammar changes
- Calcite integration tests for query planning
- Performance tests for critical paths

## Test Organization
- Follow existing test structure in each module
- Unit tests in `src/test/java` directory
- Integration tests in `integ-test/` module
- Test utilities and base classes in appropriate packages

## Test Execution Commands
- Run all tests: `./gradlew test`
- Module-specific tests: `./gradlew :core:test`, `./gradlew :ppl:test`
- Integration tests: `./gradlew :integ-test:integTest`
- Build and test: `./gradlew build`

## Integration Test Execution Best Practices

### Running Specific Integration Tests
```bash
# Run single test class
./gradlew :integ-test:integTest --tests "org.opensearch.sql.calcite.remote.CalcitePPLAggregationIT"

# Run specific test method
./gradlew :integ-test:integTest --tests "org.opensearch.sql.calcite.remote.CalcitePPLAggregationIT.testEarliestAndLatest"

# Run tests matching pattern
./gradlew :integ-test:integTest --tests "org.opensearch.sql.calcite.remote.CalcitePPLAggregationIT.testEarliest*"

# Run with verbose output for debugging
./gradlew :integ-test:integTest --tests "TestClass.testMethod" --info
```

### Integration Test Debugging Workflow
1. **Run failing test in isolation**: Use `--tests` flag to run only the failing test
2. **Enable verbose logging**: Add `--info` flag to see detailed execution logs
3. **Check test data**: Examine test data files in `integ-test/src/test/resources/`
4. **Analyze expectations**: Manually verify expected results match test data
5. **Check server side logs**: Check server side logs for the output from production code (We don't see them in logs from integration test itself)
   1. By default: `integ-test/build/testclusters/integTest-0/logs/`
   2. For remote cluster: `integ-test/build/testclusters/remoteCluster-0/logs/`
6. **Incremental fixes**: Fix one test at a time, verify, then move to next

### Integration Test File Naming and Location
- **Integration Tests (`*IT.java`)**: Located in `integ-test/` module, run with `./gradlew :integ-test:integTest`
- **Unit Tests (`*Test.java`)**: Located in individual module `src/test/java/`, run with `./gradlew :module:test`
- **Key Distinction**: Files ending with `IT` are integration tests and require the OpenSearch cluster setup
- **Example**: `CalcitePPLAggregationIT` runs successfully because it's in `integ-test/` module

### Common Integration Test Issues
- **Test data misunderstanding**: Always examine actual test data files first
- **Wrong test execution**: `*IT` files must be run with `:integ-test:integTest`, not regular `:test`

## PPL Parser Testing
- Test new grammar rules with positive and negative cases
- Verify AST generation for new syntax
- Test error handling for malformed queries
- Include edge cases and boundary conditions

## Function Testing
- Test function implementations in isolation
- Verify SQL and PPL compatibility where applicable
- Test error conditions and edge cases
- Performance testing for complex functions

## Integration Testing
- End-to-end query execution tests
- Cross-module functionality verification
- OpenSearch integration scenarios
- Backward compatibility validation

## Test Data Management
- Use meaningful test data that reflects real-world scenarios
- Clean up test resources after execution
- Avoid dependencies between test cases
- Use parameterized tests for multiple input scenarios

## Continuous Integration
- All tests must pass before merging
- Run integration tests on significant changes
- Monitor test execution time and optimize slow tests
- Maintain test stability and reliability
