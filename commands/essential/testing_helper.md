# Testing Helper - Claude Code Slash Commands

## Purpose
Testing commands for writing tests, improving coverage, and debugging test failures. Save these as markdown files in `.claude/commands/test/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/test
# Save each command below as a .md file
# Example: save write-tests as .claude/commands/test/write-tests.md
# Usage in Claude: /project:test:write-tests
```

## Test Writing Commands

### /project:test:write-tests
File: `.claude/commands/test/write-tests.md`
```markdown
Write comprehensive tests for: $ARGUMENTS

Include:
- Happy path cases
- Edge cases and boundaries
- Error scenarios
- Type validation
- Mock external dependencies
- Arrange-Act-Assert pattern
- Descriptive test names
```

### /project:test:unit-tests
File: `.claude/commands/test/unit-tests.md`
```markdown
Create unit tests for function/class: $ARGUMENTS

Generate tests for:
- All public methods
- Constructor scenarios
- State management
- Method interactions
- Error handling
- Input validation
- Output verification
```

### /project:test:integration-tests
File: `.claude/commands/test/integration-tests.md`
```markdown
Write integration tests for: $ARGUMENTS

Cover:
- API endpoint testing
- Database interactions
- Service integrations
- Authentication flows
- Error responses
- Data validation
- Performance benchmarks
```

### /project:test:e2e-tests
File: `.claude/commands/test/e2e-tests.md`
```markdown
Create end-to-end test for user flow: $ARGUMENTS

Include:
- Step-by-step user actions
- Assertions at each step
- Error recovery scenarios
- Different browser/device support
- Performance criteria
- Accessibility checks
```

## Coverage Commands

### /project:test:coverage
File: `.claude/commands/test/coverage.md`
```markdown
Analyze test coverage and identify gaps:
1. Run coverage analysis
2. Show uncovered lines/functions
3. Identify critical untested paths
4. Prioritize coverage improvements
5. Suggest specific tests needed
6. Calculate coverage impact
```

### /project:test:improve-coverage
File: `.claude/commands/test/improve-coverage.md`
```markdown
Improve test coverage for: $ARGUMENTS

Steps:
1. Find untested code paths
2. Identify edge cases
3. Write missing tests
4. Test error conditions
5. Add boundary tests
6. Verify coverage increase
```

### /project:test:coverage-report
File: `.claude/commands/test/coverage-report.md`
```markdown
Generate detailed coverage report:
- Overall coverage percentage
- Per-file coverage breakdown
- Uncovered lines highlighted
- Branch coverage analysis
- Trend over time
- Coverage goals vs actual
```

## Test Debugging Commands

### /project:test:debug-failing
File: `.claude/commands/test/debug-failing.md`
```markdown
Debug failing test: $ARGUMENTS

Analyze:
1. Error message meaning
2. Test expectations vs reality
3. Mock/stub issues
4. Timing problems
5. Environment dependencies
6. Suggest fixes
```

### /project:test:fix-flaky
File: `.claude/commands/test/fix-flaky.md`
```markdown
Fix flaky/intermittent test: $ARGUMENTS

Check for:
- Timing dependencies
- Async operation issues
- Test isolation problems
- Random data dependencies
- Network/external service calls
- Race conditions
```

### /project:test:test-isolation
File: `.claude/commands/test/test-isolation.md`
```markdown
Debug test isolation issues:
1. Identify shared state
2. Check setup/teardown
3. Find test dependencies
4. Isolate failing test
5. Fix side effects
6. Verify clean runs
```

## Mock & Stub Commands

### /project:test:create-mocks
File: `.claude/commands/test/create-mocks.md`
```markdown
Create mocks for: $ARGUMENTS

Generate:
- Interface-based mocks
- Function stubs
- API response mocks
- Database query mocks
- External service mocks
- Verify mock interactions
```

### /project:test:mock-api
File: `.claude/commands/test/mock-api.md`
```markdown
Mock external API for testing: $ARGUMENTS

Setup:
- Intercept HTTP requests
- Return test data
- Simulate error responses
- Test timeout scenarios
- Verify request format
- Control response timing
```

### /project:test:mock-database
File: `.claude/commands/test/mock-database.md`
```markdown
Mock database operations for: $ARGUMENTS

Include:
- Query result mocking
- Transaction simulation
- Error condition testing
- Performance characteristics
- Data validation
- Connection handling
```

## Test Organization Commands

### /project:test:organize
File: `.claude/commands/test/organize.md`
```markdown
Organize test suite structure:
1. Group related tests
2. Create helper functions
3. Set up test utilities
4. Standardize naming
5. Improve readability
6. Reduce duplication
```

### /project:test:helpers
File: `.claude/commands/test/helpers.md`
```markdown
Create test helper functions for: $ARGUMENTS

Generate:
- Factory functions
- Custom matchers
- Setup utilities
- Assertion helpers
- Mock builders
- Common patterns
```

### /project:test:refactor
File: `.claude/commands/test/refactor.md`
```markdown
Refactor tests for better maintainability:
- Extract common setup
- Remove duplication
- Improve assertions
- Better test names
- Clearer structure
- Faster execution
```

## Framework-Specific Commands

### /project:test:jest
File: `.claude/commands/test/jest.md`
```markdown
Create Jest tests for: $ARGUMENTS

Include:
- describe/it structure
- beforeEach/afterEach hooks
- Jest matchers
- Mock functions
- Snapshot testing
- Async test handling
```

### /project:test:react
File: `.claude/commands/test/react.md`
```markdown
Test React component: $ARGUMENTS

Cover:
- Component rendering
- Props validation
- State changes
- Event handling
- User interactions
- Lifecycle methods
- Hook testing
```

### /project:test:api
File: `.claude/commands/test/api.md`
```markdown
Test API endpoints for: $ARGUMENTS

Verify:
- Request/response format
- Status codes
- Error handling
- Authentication
- Validation
- Rate limiting
- Performance
```

## Performance Testing Commands

### /project:test:performance
File: `.claude/commands/test/performance.md`
```markdown
Create performance tests for: $ARGUMENTS

Measure:
- Response times
- Memory usage
- CPU utilization
- Throughput
- Load capacity
- Stress limits
- Resource leaks
```

### /project:test:load
File: `.claude/commands/test/load.md`
```markdown
Design load test for: $ARGUMENTS

Plan:
- User scenarios
- Load patterns
- Performance criteria
- Bottleneck identification
- Scalability testing
- Failure conditions
```

## Test Data Commands

### /project:test:fixtures
File: `.claude/commands/test/fixtures.md`
```markdown
Create test fixtures for: $ARGUMENTS

Generate:
- Sample data sets
- Edge case data
- Error condition data
- Realistic test data
- Minimal data sets
- Cleanup procedures
```

### /project:test:factories
File: `.claude/commands/test/factories.md`
```markdown
Create data factories for: $ARGUMENTS

Build:
- Object creation functions
- Configurable parameters
- Relationship handling
- Random data generation
- Test isolation
- Cleanup automation
```

## CI/CD Integration Commands

### /project:test:ci-setup
File: `.claude/commands/test/ci-setup.md`
```markdown
Configure tests for CI/CD pipeline:
1. Set up test environments
2. Configure parallel execution
3. Add coverage reporting
4. Set failure thresholds
5. Configure notifications
6. Cache test dependencies
```

### /project:test:pre-commit
File: `.claude/commands/test/pre-commit.md`
```markdown
Set up pre-commit test hooks:
- Run fast unit tests
- Check test formatting
- Verify no .only() tests
- Update snapshots if needed
- Check coverage thresholds
- Lint test files
```

## Test Strategy Commands

### /project:test:strategy
File: `.claude/commands/test/strategy.md`
```markdown
Create testing strategy for: $ARGUMENTS

Define:
- Test pyramid approach
- Coverage goals
- Test types needed
- CI/CD integration
- Manual testing needs
- Performance criteria
```

### /project:test:tdd
File: `.claude/commands/test/tdd.md`
```markdown
Guide Test-Driven Development for: $ARGUMENTS

Steps:
1. Write failing test
2. Implement minimal code
3. Make test pass
4. Refactor code
5. Repeat cycle
6. Verify coverage
```

## Quick Testing Commands

### /project:test:run
File: `.claude/commands/test/run.md`
```markdown
Run test suite with analysis:
1. Execute all tests
2. Show pass/fail summary
3. Highlight failures
4. Check coverage metrics
5. Identify slow tests
6. Suggest improvements
```

### /project:test:watch
File: `.claude/commands/test/watch.md`
```markdown
Set up test watcher for development:
- Watch file changes
- Run related tests
- Show immediate feedback
- Filter test output
- Configure watch patterns
- Optimize for speed
```

### /project:test:smoke
File: `.claude/commands/test/smoke.md`
```markdown
Run smoke tests to verify basic functionality:
- Critical path tests only
- Fast execution
- Core feature verification
- Basic integration checks
- Essential API endpoints
- Key user flows
```

## Test Review Commands

### /project:test:review
File: `.claude/commands/test/review.md`
```markdown
Review test quality for: $ARGUMENTS

Check:
- Test completeness
- Assertion quality
- Mock appropriateness
- Performance impact
- Maintenance burden
- Documentation clarity
```

### /project:test:antipatterns
File: `.claude/commands/test/antipatterns.md`
```markdown
Identify test anti-patterns:
- Tests testing implementation
- Overly complex setup
- Magic numbers/strings
- Time-dependent tests
- Tautological tests
- Poor isolation
```

## Usage Tips

1. **Start Simple**: Begin with happy path tests, then add edge cases
2. **Test Behavior**: Focus on what code does, not how it does it
3. **Keep Tests Fast**: Optimize for quick feedback cycles
4. **Make Tests Readable**: Tests serve as documentation
5. **Maintain Tests**: Keep tests up-to-date with code changes

Remember: Good tests give confidence in code changes and catch real bugs before they reach production.