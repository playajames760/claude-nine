# Debug Detective - Claude Code Slash Commands

## Purpose
Systematic debugging commands to find and fix bugs efficiently. Save these as markdown files in `.claude/commands/debug/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/debug
# Save each command below as a .md file
# Example: save error-analysis as .claude/commands/debug/error-analysis.md
# Usage in Claude: /project:debug:error-analysis
```

## Error Analysis Commands

### /project:debug:error-analysis
File: `.claude/commands/debug/error-analysis.md`
```markdown
Analyze this error and help me debug it: $ARGUMENTS

Provide:
- Error type identification
- Root cause analysis
- Stack trace interpretation
- Common causes for this error
- Step-by-step debugging approach
- Immediate fixes to try
- Prevention strategies
```

### /project:debug:stack-trace
File: `.claude/commands/debug/stack-trace.md`
```markdown
Analyze this stack trace: $ARGUMENTS

Break down:
- Entry point identification
- Execution path analysis
- Error origination point
- Function call chain
- Variable state at failure
- Suggest debugging strategy
```

### /project:debug:reproduce
File: `.claude/commands/debug/reproduce.md`
```markdown
Help me reproduce this bug: $ARGUMENTS

Create:
- Minimal reproduction steps
- Consistent test case
- Environment setup
- Data requirements
- Expected vs actual behavior
- Verification method
```

## Code Flow Debugging

### /project:debug:trace-flow
File: `.claude/commands/debug/trace-flow.md`
```markdown
Trace code execution flow for: $ARGUMENTS

Map out:
- Function entry points
- Variable state changes
- Conditional branches taken
- Loop iterations
- Error paths
- Exit conditions
- Performance bottlenecks
```

### /project:debug:data-flow
File: `.claude/commands/debug/data-flow.md`
```markdown
Track data flow to debug: $ARGUMENTS

Follow data through:
- Input sources
- Transformation steps
- Validation points
- Storage operations
- Output generation
- Corruption points
```

### /project:debug:state-analysis
File: `.claude/commands/debug/state-analysis.md`
```markdown
Analyze application state for debugging: $ARGUMENTS

Examine:
- Current state values
- State transitions
- Invalid states
- Race conditions
- State inconsistencies
- Recovery paths
```

## Bug Pattern Detection

### /project:debug:null-check
File: `.claude/commands/debug/null-check.md`
```markdown
Debug null/undefined reference errors in: $ARGUMENTS

Check for:
- Missing null checks
- Undefined property access
- Optional chaining opportunities
- Default value needs
- Type guard requirements
- Initialization issues
```

### /project:debug:race-condition
File: `.claude/commands/debug/race-condition.md`
```markdown
Identify and fix race conditions in: $ARGUMENTS

Analyze:
- Async operation timing
- Shared state access
- Event ordering issues
- Synchronization needs
- Critical sections
- Locking strategies
```

### /project:debug:memory-leak
File: `.claude/commands/debug/memory-leak.md`
```markdown
Debug memory leak in: $ARGUMENTS

Investigate:
- Object retention analysis
- Event listener cleanup
- Circular references
- Timer cleanup
- DOM node references
- Cache management
```

## Async Debugging Commands

### /project:debug:async-issues
File: `.claude/commands/debug/async-issues.md`
```markdown
Debug async/await problems in: $ARGUMENTS

Check:
- Promise rejection handling
- Async function chains
- Callback dependencies
- Error propagation
- Timeout handling
- Concurrent operations
```

### /project:debug:promise-chain
File: `.claude/commands/debug/promise-chain.md`
```markdown
Debug promise chain issues: $ARGUMENTS

Analyze:
- Chain execution order
- Error handling paths
- Data passing between steps
- Rejection scenarios
- Performance bottlenecks
- Chain optimization
```

### /project:debug:timing
File: `.claude/commands/debug/timing.md`
```markdown
Debug timing-related issues: $ARGUMENTS

Examine:
- Operation sequencing
- Timeout configurations
- Debounce/throttle logic
- Animation timing
- Network latency
- Performance degradation
```

## Framework-Specific Debugging

### /project:debug:react
File: `.claude/commands/debug/react.md`
```markdown
Debug React component issues: $ARGUMENTS

Check:
- Component lifecycle
- State update problems
- Props validation
- Re-render cycles
- Hook dependencies
- Event handling
- Performance optimization
```

### /project:debug:api
File: `.claude/commands/debug/api.md`
```markdown
Debug API-related issues: $ARGUMENTS

Investigate:
- Request/response format
- Authentication problems
- Rate limiting
- Timeout issues
- Error response handling
- Network connectivity
```

### /project:debug:database
File: `.claude/commands/debug/database.md`
```markdown
Debug database issues: $ARGUMENTS

Examine:
- Query performance
- Connection problems
- Transaction failures
- Constraint violations
- Deadlock detection
- Data integrity
```

## Performance Debugging

### /project:debug:performance
File: `.claude/commands/debug/performance.md`
```markdown
Debug performance issues in: $ARGUMENTS

Profile:
- Execution bottlenecks
- Memory usage patterns
- Network call efficiency
- Rendering performance
- Algorithm complexity
- Resource utilization
```

### /project:debug:slow-query
File: `.claude/commands/debug/slow-query.md`
```markdown
Debug slow database queries: $ARGUMENTS

Analyze:
- Query execution plan
- Index usage
- Table scan detection
- Join optimization
- Parameter binding
- Query rewriting
```

### /project:debug:memory-usage
File: `.claude/commands/debug/memory-usage.md`
```markdown
Debug high memory usage: $ARGUMENTS

Investigate:
- Large object allocation
- Memory leak sources
- Garbage collection
- Cache efficiency
- Object pooling
- Memory profiling
```

## Interactive Debugging Commands

### /project:debug:add-logging
File: `.claude/commands/debug/add-logging.md`
```markdown
Add strategic logging for debugging: $ARGUMENTS

Place logs at:
- Function entry/exit points
- Variable state changes
- Conditional branches
- Error conditions
- Performance checkpoints
- User interactions
```

### /project:debug:breakpoints
File: `.claude/commands/debug/breakpoints.md`
```markdown
Set up debugging breakpoints for: $ARGUMENTS

Configure:
- Strategic breakpoint placement
- Conditional breakpoints
- Watch expressions
- Call stack analysis
- Variable inspection
- Step-through strategy
```

### /project:debug:console-debug
File: `.claude/commands/debug/console-debug.md`
```markdown
Set up console debugging for: $ARGUMENTS

Add:
- Structured console output
- Debug levels
- Conditional logging
- Performance timing
- Error context
- User action tracking
```

## Root Cause Analysis

### /project:debug:five-whys
File: `.claude/commands/debug/five-whys.md`
```markdown
Apply Five Whys analysis to: $ARGUMENTS

Questions:
1. Why did the error occur?
2. Why did that condition happen?
3. Why wasn't it prevented?
4. Why wasn't it caught earlier?
5. Why wasn't it anticipated?
Suggest preventive measures.
```

### /project:debug:timeline
File: `.claude/commands/debug/timeline.md`
```markdown
Create bug timeline for: $ARGUMENTS

Document:
- When bug was introduced
- Related code changes
- Environment changes
- User reports timeline
- Fix attempts history
- Current status
```

### /project:debug:bisect
File: `.claude/commands/debug/bisect.md`
```markdown
Use git bisect to find bug introduction: $ARGUMENTS

Guide through:
- Bisect session setup
- Good/bad commit identification
- Testing each commit
- Narrowing down changes
- Identifying root cause
```

## Environment Debugging

### /project:debug:environment
File: `.claude/commands/debug/environment.md`
```markdown
Debug environment-specific issues: $ARGUMENTS

Check:
- Environment variable differences
- Configuration mismatches
- Dependency version conflicts
- Platform-specific behavior
- Network configuration
- Security settings
```

### /project:debug:browser
File: `.claude/commands/debug/browser.md`
```markdown
Debug browser-specific issues: $ARGUMENTS

Test across:
- Different browsers
- Browser versions
- Device types
- Screen sizes
- Network conditions
- JavaScript engine differences
```

## Quick Debug Commands

### /project:debug:emergency
File: `.claude/commands/debug/emergency.md`
```markdown
Emergency debugging session for production issue: $ARGUMENTS

Immediate steps:
1. Assess impact and severity
2. Gather error information
3. Check recent deployments
4. Identify quick fixes
5. Implement workaround
6. Plan proper fix
```

### /project:debug:checklist
File: `.claude/commands/debug/checklist.md`
```markdown
Debugging checklist for: $ARGUMENTS

Verify:
□ Error reproduction steps
□ Environment setup
□ Recent changes
□ Log analysis
□ Stack trace review
□ Test coverage
□ Fix validation
```

### /project:debug:hypothesis
File: `.claude/commands/debug/hypothesis.md`
```markdown
Form debugging hypothesis for: $ARGUMENTS

Create:
- Observation summary
- Possible causes list
- Testable hypotheses
- Verification methods
- Priority ranking
- Next steps plan
```

## Documentation & Learning

### /project:debug:document-fix
File: `.claude/commands/debug/document-fix.md`
```markdown
Document bug fix for: $ARGUMENTS

Include:
- Problem description
- Root cause analysis
- Solution implemented
- Testing performed
- Prevention measures
- Lessons learned
```

### /project:debug:post-mortem
File: `.claude/commands/debug/post-mortem.md`
```markdown
Create post-mortem for: $ARGUMENTS

Cover:
- Incident timeline
- Root cause analysis
- Impact assessment
- Resolution steps
- Process improvements
- Action items
```

## Usage Tips

1. **Start with Reproduction**: Always try to reproduce the bug first
2. **Gather Context**: Collect error messages, logs, and environment info
3. **Form Hypotheses**: Create testable theories about the cause
4. **Test Systematically**: Verify each hypothesis methodically
5. **Document Everything**: Keep track of what you've tried

Remember: Debugging is a systematic process. Stay calm, be methodical, and let the evidence guide you to the solution.