# Context Manager - CLAUDE.md Maintenance

Systematic management of project context through CLAUDE.md files to ensure continuity across AI development sessions.

## Purpose

Maintain project memory and context that enables effective AI-dependent development by:
- Creating and updating CLAUDE.md files with project-specific guidance
- Optimizing context for clarity and relevance
- Managing project patterns, decisions, and constraints
- Ensuring session continuity across development cycles

## Core Operations

### Initialize Project Context
When starting a new project or adding Claude Nine to existing projects:

1. **Analyze Project Structure**
   - Examine codebase architecture and patterns
   - Identify technology stack and frameworks
   - Review existing documentation and conventions
   - Assess current development workflows

2. **Create Initial CLAUDE.md**
   ```markdown
   # Project Context

   ## Project Overview
   [Brief description of project purpose and scope]

   ## Architecture Overview
   [High-level architecture pattern and key components]

   ## Technology Stack
   - Framework: [React/Vue/Angular/etc]
   - Backend: [Node.js/Python/Java/etc]
   - Database: [PostgreSQL/MongoDB/etc]
   - Deployment: [AWS/Vercel/etc]

   ## Development Patterns
   [Project-specific coding patterns and preferences]

   ## Key Constraints
   [Performance, security, or business constraints]

   ## Testing Strategy
   [Testing frameworks and coverage requirements]

   ## Deployment Process
   [Build, test, and deployment procedures]
   ```

### Update Context After Features
After implementing significant features or making architectural changes:

1. **Document New Patterns**
   - Add new coding patterns or conventions
   - Record architectural decisions and rationale
   - Update component interaction patterns
   - Note any new dependencies or tools

2. **Update Architecture Information**
   - Reflect structural changes
   - Document new component relationships
   - Update data flow descriptions
   - Record performance considerations

3. **Maintain Decision History**
   - Log important technical decisions
   - Include rationale for choices made
   - Document trade-offs considered
   - Record lessons learned

### Context Cleanup and Optimization
Regular maintenance to keep CLAUDE.md relevant and concise:

1. **Remove Outdated Information**
   - Delete deprecated patterns or approaches
   - Remove obsolete constraints or requirements
   - Clean up outdated architecture references
   - Eliminate redundant or conflicting guidance

2. **Consolidate Related Information**
   - Merge similar patterns or guidelines
   - Organize information logically
   - Create clear section hierarchies
   - Improve readability and navigation

3. **Enhance Clarity and Specificity**
   - Make guidelines more actionable
   - Add specific examples where helpful
   - Clarify ambiguous statements
   - Ensure consistency in terminology

## Context Structure Templates

### For New Projects
```markdown
# [Project Name] Context

## Project Overview
Brief description of project purpose, target users, and key functionality.

## Architecture Overview
- Pattern: [MVC/Microservices/JAMstack/etc]
- Key Components: [List main components and their responsibilities]
- Data Flow: [High-level data flow description]

## Technology Stack
- Frontend: [Framework and key libraries]
- Backend: [Runtime and frameworks]
- Database: [Database choice and ORM/query layer]
- Infrastructure: [Hosting and deployment platform]
- Testing: [Testing frameworks and tools]

## Development Standards
- Code Style: [ESLint config, Prettier settings, etc]
- File Organization: [Directory structure conventions]
- Naming Conventions: [Variable, function, file naming patterns]
- Component Patterns: [Preferred component structures]

## Key Constraints
- Performance: [Load time requirements, bundle size limits]
- Security: [Authentication requirements, data protection]
- Browser Support: [Supported browsers and versions]
- Accessibility: [WCAG compliance level]

## Custom Workflows
[Any project-specific Claude Nine command extensions]
```

### For Established Projects
```markdown
# [Project Name] Context

## Current State
- Version: [Current version or milestone]
- Last Updated: [Date of last significant changes]
- Active Development Areas: [Current focus areas]

## Architecture Overview
[Evolved architecture description with recent changes]

## Established Patterns
[Consolidated patterns that have proven effective]

## Recent Decisions
[Important decisions made in recent development cycles]

## Known Issues
[Technical debt or issues requiring future attention]

## Deployment Configuration
[Current deployment pipeline and environment setup]
```

## Context Update Triggers

### Automatic Updates (AI-Driven)
Update context when:
- Major feature implementation completed
- Architecture changes implemented
- New dependencies added
- Performance optimizations completed
- Security measures implemented
- Testing strategies evolved

### Manual Review Triggers
Prompt for manual context review when:
- Project milestones reached
- Technology stack changes considered
- Team composition changes
- Requirements significantly evolve
- Performance issues encountered

## Quality Assurance for Context

### Context Validation Checklist
- [ ] Information is current and accurate
- [ ] Guidelines are specific and actionable
- [ ] No conflicting or contradictory guidance
- [ ] Architecture accurately reflects current state
- [ ] Patterns are well-documented with examples
- [ ] Constraints are clearly stated
- [ ] Custom workflows are properly defined

### Context Optimization Guidelines
1. **Clarity**: Every guideline should be unambiguous
2. **Relevance**: Remove information not actively used
3. **Completeness**: Cover all areas important for development
4. **Consistency**: Use consistent terminology throughout
5. **Actionability**: Focus on guidance that affects implementation
6. **Evolution**: Update to reflect project growth and learning

## Integration with Development Workflow

### Session Start Protocol
1. Read current CLAUDE.md
2. Identify any updates needed based on recent changes
3. Note any areas requiring clarification
4. Load project-specific patterns and constraints

### Session End Protocol
1. Identify new patterns or decisions from session
2. Update CLAUDE.md with relevant learnings
3. Clean up any outdated information discovered
4. Ensure consistency with recent changes

### Weekly Maintenance
1. Review CLAUDE.md for outdated information
2. Consolidate recent updates for clarity
3. Verify accuracy of architecture descriptions
4. Update any changed constraints or requirements

---

**Usage Examples:**

```bash
# Initialize context for new project
/context-manager --initialize

# Update context after feature implementation
/context-manager --update-feature "user authentication system"

# Clean up and optimize existing context
/context-manager --cleanup

# Add architectural decision
/context-manager --add-decision "chose Redis for session storage due to performance requirements"
```