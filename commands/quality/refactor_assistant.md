# Refactor Assistant - Claude Code Slash Commands

## Purpose
Code improvement commands for refactoring, reducing technical debt, and modernizing codebases. Save these as markdown files in `.claude/commands/refactor/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/refactor
# Save each command below as a .md file
# Example: save code-smells as .claude/commands/refactor/code-smells.md
# Usage in Claude: /project:refactor:code-smells
```

## Code Analysis Commands

### /project:refactor:code-smells
File: `.claude/commands/refactor/code-smells.md`
```markdown
Identify code smells in: $ARGUMENTS

Look for:
- Long methods/functions
- Large classes
- Duplicate code
- Feature envy
- Data clumps
- Primitive obsession
- Switch statements
- Dead code
Suggest refactoring approaches for each issue found.
```

### /project:refactor:complexity
File: `.claude/commands/refactor/complexity.md`
```markdown
Analyze code complexity and suggest simplifications for: $ARGUMENTS

Check:
- Cyclomatic complexity > 10
- Deeply nested code
- Long parameter lists
- Complex conditionals
- Coupled components
- God objects
Provide specific refactoring recommendations.
```

### /project:refactor:maintainability
File: `.claude/commands/refactor/maintainability.md`
```markdown
Improve code maintainability for: $ARGUMENTS

Address:
- Poor naming conventions
- Missing abstractions
- Inconsistent patterns
- Magic numbers/strings
- Commented-out code
- Lack of documentation
Suggest specific improvements.
```

## Method Refactoring Commands

### /project:refactor:extract-method
File: `.claude/commands/refactor/extract-method.md`
```markdown
Extract methods from: $ARGUMENTS

Process:
1. Identify logical chunks
2. Create meaningful method names
3. Handle parameters properly
4. Preserve all behavior
5. Update all callers
6. Add appropriate tests
```

### /project:refactor:simplify-conditions
File: `.claude/commands/refactor/simplify-conditions.md`
```markdown
Simplify complex conditionals in: $ARGUMENTS

Apply techniques:
- Extract to named functions
- Use early returns
- Replace with polymorphism
- Introduce guard clauses
- Use strategy pattern
- Eliminate nested conditions
```

### /project:refactor:parameters
File: `.claude/commands/refactor/parameters.md`
```markdown
Improve method parameters for: $ARGUMENTS

Techniques:
- Introduce parameter objects
- Remove unused parameters
- Add default values
- Use destructuring
- Replace with method calls
- Validate parameter types
```

## Class Refactoring Commands

### /project:refactor:extract-class
File: `.claude/commands/refactor/extract-class.md`
```markdown
Extract class from large class: $ARGUMENTS

Steps:
1. Identify distinct responsibilities
2. Group related methods and fields
3. Create new class with clear purpose
4. Move members appropriately
5. Update dependencies
6. Maintain all behavior
```

### /project:refactor:composition
File: `.claude/commands/refactor/composition.md`
```markdown
Replace inheritance with composition in: $ARGUMENTS

Process:
1. Identify shared behavior
2. Create component classes
3. Use delegation instead of inheritance
4. Remove inheritance relationships
5. Update tests
6. Verify behavior preservation
```

### /project:refactor:interfaces
File: `.claude/commands/refactor/interfaces.md`
```markdown
Extract interfaces from: $ARGUMENTS

Create:
- Clean public APIs
- Testable interfaces
- Dependency abstractions
- Polymorphic behavior
- Type safety improvements
- Mockable dependencies
```

## Pattern Introduction Commands

### /project:refactor:factory-pattern
File: `.claude/commands/refactor/factory-pattern.md`
```markdown
Introduce factory pattern for: $ARGUMENTS

Implement:
1. Identify object creation logic
2. Create factory interface
3. Implement concrete factories
4. Replace direct instantiation
5. Add proper error handling
6. Include comprehensive tests
```

### /project:refactor:strategy-pattern
File: `.claude/commands/refactor/strategy-pattern.md`
```markdown
Apply strategy pattern to: $ARGUMENTS

Steps:
1. Identify algorithm variations
2. Create strategy interface
3. Implement concrete strategies
4. Update context to use strategies
5. Eliminate conditional logic
6. Add strategy selection logic
```

### /project:refactor:observer-pattern
File: `.claude/commands/refactor/observer-pattern.md`
```markdown
Implement observer pattern for: $ARGUMENTS

Setup:
1. Identify events/notifications
2. Create observer interface
3. Implement subject class
4. Register/unregister observers
5. Decouple components
6. Handle observer lifecycle
```

## Modern Syntax Commands

### /project:refactor:modern-js
File: `.claude/commands/refactor/modern-js.md`
```markdown
Modernize JavaScript code in: $ARGUMENTS

Update to use:
- Arrow functions
- Destructuring assignment
- Template literals
- Optional chaining
- Nullish coalescing
- Async/await
- ES modules
```

### /project:refactor:async-await
File: `.claude/commands/refactor/async-await.md`
```markdown
Convert to async/await pattern: $ARGUMENTS

Transform:
1. Callback-based code
2. Promise chains
3. Error handling
4. Parallel operations
5. Sequential operations
6. Proper cleanup
```

### /project:refactor:functional
File: `.claude/commands/refactor/functional.md`
```markdown
Apply functional programming patterns to: $ARGUMENTS

Convert:
- Loops to map/filter/reduce
- Mutable to immutable operations
- Side effects to pure functions
- Imperative to declarative style
- Object mutation to new objects
- Shared state to isolated functions
```

## Performance Refactoring Commands

### /project:refactor:performance
File: `.claude/commands/refactor/performance.md`
```markdown
Optimize performance for: $ARGUMENTS

Improve:
- Algorithm complexity
- Memory usage
- Database queries
- Network requests
- Rendering performance
- Bundle size
- Caching strategies
```

### /project:refactor:memory
File: `.claude/commands/refactor/memory.md`
```markdown
Optimize memory usage in: $ARGUMENTS

Address:
- Memory leaks
- Large object allocations
- Inefficient data structures
- Object pooling opportunities
- Garbage collection pressure
- Cache optimization
```

### /project:refactor:database
File: `.claude/commands/refactor/database.md`
```markdown
Optimize database interactions in: $ARGUMENTS

Improve:
- Query efficiency
- N+1 query problems
- Index usage
- Batch operations
- Connection pooling
- Transaction management
```

## Architecture Refactoring Commands

### /project:refactor:modules
File: `.claude/commands/refactor/modules.md`
```markdown
Refactor module structure for: $ARGUMENTS

Reorganize:
- Split large modules
- Group related functionality
- Improve import/export structure
- Reduce circular dependencies
- Create clear boundaries
- Improve cohesion
```

### /project:refactor:dependencies
File: `.claude/commands/refactor/dependencies.md`
```markdown
Clean up dependencies in: $ARGUMENTS

Actions:
- Remove unused imports
- Consolidate similar dependencies
- Update deprecated packages
- Reduce bundle size
- Improve loading performance
- Update to latest versions
```

### /project:refactor:structure
File: `.claude/commands/refactor/structure.md`
```markdown
Improve project structure for: $ARGUMENTS

Reorganize:
- Directory hierarchy
- File naming conventions
- Feature grouping
- Separation of concerns
- Configuration management
- Build optimization
```

## Type Safety Commands

### /project:refactor:add-types
File: `.claude/commands/refactor/add-types.md`
```markdown
Add type safety to: $ARGUMENTS

Implement:
- TypeScript types
- Interface definitions
- Generic types
- Union/intersection types
- Type guards
- Strict null checks
```

### /project:refactor:type-errors
File: `.claude/commands/refactor/type-errors.md`
```markdown
Fix type errors in: $ARGUMENTS

Resolve:
- Type mismatches
- Missing type annotations
- Incorrect generic usage
- Null/undefined issues
- Import/export types
- Configuration problems
```

## Safe Refactoring Commands

### /project:refactor:plan
File: `.claude/commands/refactor/plan.md`
```markdown
Create refactoring plan for: $ARGUMENTS

Include:
1. Impact analysis
2. Incremental steps
3. Risk assessment
4. Testing strategy
5. Rollback plan
6. Timeline estimation
```

### /project:refactor:incremental
File: `.claude/commands/refactor/incremental.md`
```markdown
Perform incremental refactoring of: $ARGUMENTS

Steps:
1. Add characterization tests
2. Make small, safe changes
3. Run tests after each change
4. Commit frequently
5. Monitor for regressions
6. Document changes
```

### /project:refactor:validate
File: `.claude/commands/refactor/validate.md`
```markdown
Validate refactoring safety for: $ARGUMENTS

Verify:
- All tests still pass
- Performance hasn't degraded
- API contracts maintained
- Dependencies still work
- Documentation updated
- No behavioral changes
```

## Legacy Code Commands

### /project:refactor:legacy
File: `.claude/commands/refactor/legacy.md`
```markdown
Modernize legacy code: $ARGUMENTS

Approach:
1. Add comprehensive tests
2. Extract interfaces
3. Replace deprecated APIs
4. Update language features
5. Improve error handling
6. Add proper logging
```

### /project:refactor:framework-upgrade
File: `.claude/commands/refactor/framework-upgrade.md`
```markdown
Upgrade framework version for: $ARGUMENTS

Process:
1. Identify breaking changes
2. Update deprecated APIs
3. Modify configurations
4. Fix type issues
5. Update dependencies
6. Test thoroughly
```

## Quick Refactoring Commands

### /project:refactor:quick-wins
File: `.claude/commands/refactor/quick-wins.md`
```markdown
Identify quick refactoring wins in: $ARGUMENTS

Find:
- Unused variables/imports
- Magic numbers to constants
- Long method names
- Simple extractions
- Obvious duplications
- Easy modernizations
```

### /project:refactor:naming
File: `.claude/commands/refactor/naming.md`
```markdown
Improve naming throughout: $ARGUMENTS

Update:
- Variables to be descriptive
- Functions to show intent
- Classes to represent purpose
- Files for clarity
- Remove abbreviations
- Use domain language
```

### /project:refactor:cleanup
File: `.claude/commands/refactor/cleanup.md`
```markdown
Clean up code in: $ARGUMENTS

Remove:
- Dead code
- Commented code
- Unused imports
- Debug statements
- Temporary variables
- Redundant comments
```

## Quality Metrics Commands

### /project:refactor:metrics
File: `.claude/commands/refactor/metrics.md`
```markdown
Measure refactoring impact for: $ARGUMENTS

Track:
- Complexity reduction
- Test coverage increase
- Performance improvement
- Bundle size change
- Maintainability index
- Technical debt score
```

### /project:refactor:debt
File: `.claude/commands/refactor/debt.md`
```markdown
Assess technical debt in: $ARGUMENTS

Identify:
- Code smells
- Outdated patterns
- Missing tests
- Poor abstractions
- Coupling issues
- Documentation gaps
```

## Usage Tips

1. **Start Small**: Begin with small, safe refactoring steps
2. **Test First**: Always have tests before refactoring
3. **One Thing**: Focus on one refactoring technique at a time
4. **Measure Impact**: Track metrics before and after
5. **Document Changes**: Keep clear records of what and why

Remember: Refactoring should improve code quality without changing behavior. Always maintain existing functionality.