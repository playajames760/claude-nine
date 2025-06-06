# Codebase Chat - Claude Code Slash Commands

## Purpose
Exploration and brainstorming commands for understanding codebases and ideating features. Save these as markdown files in `.claude/commands/explore/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/explore
# Save each command below as a .md file
# Example: save architecture as .claude/commands/explore/architecture.md
# Usage in Claude: /project:explore:architecture
```

## Architecture Understanding Commands

### /project:explore:architecture
File: `.claude/commands/explore/architecture.md`
```markdown
Analyze the codebase architecture and provide:
- Overall architecture pattern (MVC, microservices, etc.)
- Main components and their responsibilities
- Data flow between components
- Technology stack rationale
- Design patterns used
- Strengths and potential improvements
```

### /project:explore:dependencies
File: `.claude/commands/explore/dependencies.md`
```markdown
Analyze project dependencies and report:
- Core vs development dependencies
- Outdated packages
- Security vulnerabilities
- Bundle size impact
- License compatibility
- Dependency tree complexity
- Opportunities for reduction
```

### /project:explore:patterns
File: `.claude/commands/explore/patterns.md`
```markdown
Identify design patterns used in the codebase:
- Architectural patterns (MVC, MVVM, etc.)
- Creational patterns (Factory, Singleton, etc.)
- Behavioral patterns (Observer, Strategy, etc.)
- Structural patterns (Adapter, Decorator, etc.)
- Pattern implementation quality
- Missing patterns that could help
```

## Code Discovery Commands

### /project:explore:find-feature
File: `.claude/commands/explore/find-feature.md`
```markdown
Locate implementation of feature: $ARGUMENTS

Show me:
- Entry points and main files
- Core business logic location
- Database schemas/queries
- API endpoints
- Frontend components
- Configuration files
- Tests related to this feature
```

### /project:explore:trace-flow
File: `.claude/commands/explore/trace-flow.md`
```markdown
Trace the complete flow for: $ARGUMENTS

Map the path from:
1. User interaction/API call
2. Input validation
3. Business logic processing
4. Database operations
5. External service calls
6. Response generation
7. Error handling paths
```

### /project:explore:cross-cutting
File: `.claude/commands/explore/cross-cutting.md`
```markdown
Analyze how the codebase handles cross-cutting concerns:
- Authentication and authorization
- Error handling and logging
- Caching strategies
- Rate limiting
- Data validation
- Configuration management
- Security measures
```

## Business Logic Analysis Commands

### /project:explore:domain
File: `.claude/commands/explore/domain.md`
```markdown
Explain the business domain and logic:
- Core problem being solved
- Key business rules
- Domain model entities
- Critical workflows
- Business constraints
- Revenue/value generation
- User personas served
```

### /project:explore:api
File: `.claude/commands/explore/api.md`
```markdown
Generate comprehensive API documentation:
- All available endpoints
- Request/response formats
- Authentication requirements
- Rate limits and quotas
- Error response codes
- Example usage scenarios
- SDK or client examples
```

### /project:explore:config
File: `.claude/commands/explore/config.md`
```markdown
Document all configuration options:
- Environment variables
- Feature flags
- Database configurations
- Third-party service settings
- Security configurations
- Performance tuning options
- Default vs required values
```

## Feature Brainstorming Commands

### /project:explore:feasibility
File: `.claude/commands/explore/feasibility.md`
```markdown
Analyze feasibility of implementing: $ARGUMENTS

Assess:
- Technical complexity
- Required code changes
- Database schema impacts
- API changes needed
- Frontend modifications
- Third-party integrations
- Estimated development time
- Potential risks and blockers
```

### /project:explore:implementation-plan
File: `.claude/commands/explore/implementation-plan.md`
```markdown
Create implementation plan for: $ARGUMENTS

Break down into:
1. Requirements analysis
2. Design decisions
3. Database changes
4. Backend implementation
5. Frontend changes
6. Testing strategy
7. Deployment considerations
8. Documentation needs
```

### /project:explore:alternatives
File: `.claude/commands/explore/alternatives.md`
```markdown
Explore alternative approaches for: $ARGUMENTS

Compare options by:
- Development complexity
- Performance impact
- Maintenance overhead
- User experience
- Scalability
- Cost implications
- Risk factors
- Time to market
```

## Enhancement Analysis Commands

### /project:explore:performance
File: `.claude/commands/explore/performance.md`
```markdown
Identify performance improvement opportunities:
- Slow database queries
- Inefficient algorithms
- Memory usage issues
- Network request optimization
- Caching opportunities
- Bundle size reduction
- Loading time improvements
- Scalability bottlenecks
```

### /project:explore:ux
File: `.claude/commands/explore/ux.md`
```markdown
Suggest user experience improvements:
- Loading states and feedback
- Error handling and messages
- Accessibility enhancements
- Mobile responsiveness
- Navigation improvements
- Performance optimizations
- Visual design suggestions
- User flow optimization
```

### /project:explore:dx
File: `.claude/commands/explore/dx.md`
```markdown
Analyze developer experience improvements:
- Code organization clarity
- Build process optimization
- Testing ease and speed
- Debugging capabilities
- Documentation quality
- Development environment setup
- Code generation opportunities
- Automation possibilities
```

## Technical Debt Commands

### /project:explore:debt
File: `.claude/commands/explore/debt.md`
```markdown
Identify technical debt in the codebase:
- Code smells and anti-patterns
- Outdated dependencies
- Missing or poor tests
- Documentation gaps
- Performance issues
- Security vulnerabilities
- Maintenance complexity
- Refactoring opportunities
```

### /project:explore:refactor-priorities
File: `.claude/commands/explore/refactor-priorities.md`
```markdown
Prioritize refactoring opportunities:
1. High-impact, low-effort wins
2. Critical technical debt
3. Performance bottlenecks
4. Security improvements
5. Maintainability enhancements
6. Developer productivity gains
7. User experience improvements
8. Long-term architectural changes
```

## Quality Analysis Commands

### /project:explore:standards
File: `.claude/commands/explore/standards.md`
```markdown
Review code quality standards:
- Coding conventions consistency
- File organization patterns
- Import/export practices
- Naming conventions
- Comment and documentation style
- Error handling patterns
- Testing approaches
- Git workflow practices
```

### /project:explore:best-practices
File: `.claude/commands/explore/best-practices.md`
```markdown
Assess adherence to best practices:
- SOLID principles application
- DRY principle violations
- Security best practices
- Performance optimization
- Error handling strategies
- Testing methodologies
- Documentation standards
- Deployment practices
```

## Learning Commands

### /project:explore:onboarding
File: `.claude/commands/explore/onboarding.md`
```markdown
Create new developer onboarding guide:
- Project setup instructions
- Architecture overview
- Key concepts and terminology
- Important files and directories
- Common development tasks
- Testing and debugging tips
- Deployment procedures
- Team conventions and practices
```

### /project:explore:component-deep-dive
File: `.claude/commands/explore/component-deep-dive.md`
```markdown
Provide deep dive explanation of: $ARGUMENTS

Cover:
- Purpose and responsibilities
- Key methods and functions
- Data structures used
- Dependencies and relationships
- Configuration options
- Common usage patterns
- Troubleshooting tips
- Extension possibilities
```

## Integration Analysis Commands

### /project:explore:external-services
File: `.claude/commands/explore/external-services.md`
```markdown
Catalog all external service integrations:
- Service names and purposes
- Authentication methods
- API endpoints used
- Data exchanged
- Error handling strategies
- Fallback mechanisms
- Rate limiting considerations
- Cost implications
```

### /project:explore:module-coupling
File: `.claude/commands/explore/module-coupling.md`
```markdown
Analyze coupling between modules:
- Direct dependencies
- Circular dependencies
- Interface boundaries
- Data sharing patterns
- Event-driven connections
- Shared state management
- Decoupling opportunities
- Boundary improvements
```

## Security Analysis Commands

### /project:explore:security
File: `.claude/commands/explore/security.md`
```markdown
Review security implementation:
- Authentication mechanisms
- Authorization controls
- Input validation practices
- Output encoding
- Session management
- Cryptographic usage
- Secure configuration
- Vulnerability assessment
```

### /project:explore:security-improvements
File: `.claude/commands/explore/security-improvements.md`
```markdown
Suggest security enhancements:
- Authentication strengthening
- Authorization improvements
- Input validation gaps
- Encryption opportunities
- Security header additions
- Audit logging enhancement
- Vulnerability remediation
- Security testing additions
```

## Migration Planning Commands

### /project:explore:migration-plan
File: `.claude/commands/explore/migration-plan.md`
```markdown
Plan migration from $ARGUMENTS to $ARGUMENTS:
- Current state analysis
- Target state definition
- Migration strategy options
- Risk assessment
- Incremental migration steps
- Testing approach
- Rollback procedures
- Timeline estimation
```

### /project:explore:compatibility
File: `.claude/commands/explore/compatibility.md`
```markdown
Assess compatibility for: $ARGUMENTS

Check:
- Dependency conflicts
- API breaking changes
- Database schema impacts
- Configuration changes
- Performance implications
- Security considerations
- Testing requirements
- Documentation updates
```

## Quick Analysis Commands

### /project:explore:overview
File: `.claude/commands/explore/overview.md`
```markdown
Provide project overview:
- Primary purpose and goals
- Technology stack summary
- Architecture pattern
- Key features
- Development status
- Team structure needs
- Deployment approach
- Growth opportunities
```

### /project:explore:recent-changes
File: `.claude/commands/explore/recent-changes.md`
```markdown
Analyze recent changes in the codebase:
- New features added
- Bug fixes implemented
- Refactoring completed
- Dependencies updated
- Configuration changes
- Performance improvements
- Security enhancements
- Documentation updates
```

### /project:explore:impact-analysis
File: `.claude/commands/explore/impact-analysis.md`
```markdown
Analyze impact of changing: $ARGUMENTS

Assess effects on:
- Dependent components
- Database operations
- API contracts
- User interfaces
- Test suites
- Documentation
- Deployment process
- External integrations
```

## Creative Brainstorming Commands

### /project:explore:feature-ideas
File: `.claude/commands/explore/feature-ideas.md`
```markdown
Brainstorm feature ideas based on current codebase:
- Natural extensions
- User experience improvements
- Developer productivity tools
- Integration opportunities
- Performance optimizations
- Security enhancements
- Analytics and monitoring
- Automation possibilities
```

### /project:explore:problem-solving
File: `.claude/commands/explore/problem-solving.md`
```markdown
Help solve this problem: $ARGUMENTS

Approach with:
- Problem understanding
- Constraint identification
- Solution exploration
- Tradeoff analysis
- Implementation options
- Risk assessment
- Success metrics
- Next steps
```

## Usage Tips

1. **Be Specific**: Reference exact files, functions, or features when exploring
2. **Ask Follow-ups**: Use responses to dive deeper into interesting areas
3. **Consider Context**: Think about business goals and user needs
4. **Explore Tradeoffs**: Always consider multiple approaches
5. **Document Insights**: Keep notes on important discoveries

Remember: Exploration is about understanding and discovery. Use these commands to build deep knowledge of your codebase and generate creative solutions.