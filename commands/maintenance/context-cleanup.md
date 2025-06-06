# Context Cleanup - CLAUDE.md Optimization

Systematic maintenance of project context files to ensure optimal AI development performance through clean, relevant, and well-organized project memory.

## Purpose

Maintain high-quality project context that enables effective AI development by:
- Removing outdated or irrelevant information
- Consolidating and organizing context for clarity
- Optimizing context size for performance
- Ensuring accuracy and consistency
- Improving navigation and usability

## Cleanup Methodology

### Phase 1: Content Audit
Systematic review of existing CLAUDE.md content:

1. **Information Relevance Assessment**
   - Identify outdated patterns or practices
   - Mark deprecated technologies or approaches
   - Flag contradictory or conflicting guidance
   - Assess current accuracy of architectural descriptions

2. **Usage Pattern Analysis**
   - Review which patterns are actively used
   - Identify unused or abandoned approaches
   - Assess effectiveness of existing guidelines
   - Note gaps in current documentation

3. **Quality Assessment**
   - Check for clarity and specificity
   - Identify ambiguous or unclear statements
   - Assess actionability of guidelines
   - Review consistency in terminology and formatting

### Phase 2: Content Optimization
Systematic improvement of context quality:

1. **Information Consolidation**
   - Merge related or duplicate information
   - Combine similar patterns or guidelines
   - Eliminate redundant explanations
   - Create coherent information hierarchies

2. **Clarity Enhancement**
   - Rewrite ambiguous statements
   - Add specific examples where needed
   - Improve technical accuracy
   - Standardize terminology usage

3. **Structure Optimization**
   - Reorganize information logically
   - Create clear section hierarchies
   - Improve navigation and findability
   - Balance detail with conciseness

### Phase 3: Context Validation
Ensure optimized context meets quality standards:

1. **Accuracy Verification**
   - Validate technical information
   - Confirm architectural descriptions
   - Verify constraint accuracy
   - Check dependency information

2. **Completeness Check**
   - Ensure all important areas covered
   - Identify missing critical information
   - Verify pattern completeness
   - Confirm guideline coverage

3. **Usability Testing**
   - Review context flow and organization
   - Test information findability
   - Assess clarity for new team members
   - Verify actionability of guidelines

## Cleanup Strategies

### Content Reduction Strategies
When context becomes too large or unwieldy:

1. **Historical Information Management**
   - Move old decisions to separate history file
   - Archive deprecated patterns
   - Summarize long decision rationales
   - Create reference links for detailed information

2. **Pattern Consolidation**
   - Merge similar coding patterns
   - Combine related guidelines
   - Create pattern hierarchies
   - Eliminate pattern redundancy

3. **Specificity Optimization**
   - Remove overly general statements
   - Focus on project-specific guidance
   - Eliminate obvious or universal practices
   - Emphasize unique project characteristics

### Quality Improvement Strategies
Enhance context effectiveness:

1. **Actionability Enhancement**
   - Convert descriptions to specific guidelines
   - Add concrete examples
   - Include decision trees for complex choices
   - Provide clear implementation steps

2. **Consistency Improvement**
   - Standardize terminology usage
   - Align naming conventions
   - Unify formatting approaches
   - Consolidate conflicting guidance

3. **Navigation Enhancement**
   - Create clear section headings
   - Add cross-references between related topics
   - Include table of contents for long documents
   - Use consistent formatting patterns

## Cleanup Checklist

### Content Review Checklist
- [ ] **Relevance**: All information currently applicable
- [ ] **Accuracy**: Technical details are correct
- [ ] **Consistency**: No conflicting guidance
- [ ] **Completeness**: All important areas covered
- [ ] **Clarity**: Guidelines are unambiguous
- [ ] **Actionability**: Information guides implementation
- [ ] **Organization**: Logical information structure
- [ ] **Conciseness**: No unnecessary verbosity

### Quality Metrics
Track cleanup effectiveness:

- **Context Size**: Monitor document length trends
- **Information Density**: Ratio of actionable to descriptive content
- **Update Frequency**: How often context requires changes
- **Usage Patterns**: Which sections are frequently referenced
- **Clarity Score**: Subjective assessment of information clarity

### Maintenance Triggers
Schedule cleanup when:

- Context file exceeds optimal size (typically 2000-3000 lines)
- Multiple conflicting guidelines exist
- Outdated information accumulates
- Team reports context confusion
- Major architectural changes occur
- Quarterly maintenance schedule reached

## Optimization Templates

### Streamlined Project Context Template
```markdown
# [Project] Development Context

## Quick Reference
- Framework: [Primary framework and version]
- Architecture: [Brief architecture description]
- Key Patterns: [3-5 most important patterns]
- Critical Constraints: [Essential limitations]

## Architecture Overview
[Concise but complete architectural description]

## Development Standards
### Code Organization
[File structure and naming conventions]

### Implementation Patterns
[Key patterns with examples]

### Quality Requirements
[Testing, performance, security standards]

## Current Focus Areas
[Active development priorities and considerations]

## Key Decisions
[Recent important technical decisions with brief rationale]

## Reference Links
[Links to detailed documentation, ADRs, etc.]
```

### Focused Pattern Documentation
```markdown
## [Pattern Name]

### When to Use
[Specific scenarios for pattern application]

### Implementation
[Concrete implementation steps or code example]

### Validation
[How to verify correct implementation]

### Related Patterns
[Links to complementary or alternative patterns]
```

## Automation Opportunities

### Automated Cleanup Tasks
- Remove outdated timestamps
- Check for broken internal links
- Validate code examples against current standards
- Identify duplicate or near-duplicate content
- Flag uncommonly used sections for review

### Quality Monitoring
- Track context file size over time
- Monitor update frequency patterns
- Identify sections with frequent changes
- Assess information density metrics
- Generate usage pattern reports

## Integration with Development Workflow

### Regular Maintenance Schedule
- **Weekly**: Quick relevance check during active development
- **Monthly**: Comprehensive cleanup and optimization
- **Quarterly**: Major reorganization and validation
- **Ad-hoc**: After significant architectural changes

### Cleanup Integration Points
- **Post-Feature**: Clean up after major feature completion
- **Pre-Planning**: Optimize before planning major features
- **Code Reviews**: Note context inconsistencies during reviews
- **Retrospectives**: Include context quality in team retrospectives

---

**Usage Examples:**

```bash
# Comprehensive context cleanup
/context-cleanup

# Quick relevance check
/context-cleanup --quick

# Focus on specific section
/context-cleanup --section "architecture"

# Pre-planning optimization
/context-cleanup --prepare-planning
```

**Cleanup Success Indicators:**
- Context is under 3000 lines while remaining comprehensive
- New team members can quickly understand project patterns
- Guidelines directly translate to implementation decisions
- No conflicting or contradictory guidance exists
- Information is organized logically and easy to navigate