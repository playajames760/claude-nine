# Blueprint Optimizer

## Purpose
Cleans structure, removes redundancy, and maintains focus, keeping the spec readable and token-efficient for AI processing.

## When to Run
- After several development sessions
- When file feels messy or repetitive
- Before major planning sessions
- When token usage is high
- After merging multiple updates

## Optimization Process

### 1. Content Analysis

```bash
# Check file size and line count
echo "## Spec File Stats"
wc -l CLAUDE.md
du -h CLAUDE.md

# Find repetitive sections
echo "## Repetitive Content"
grep -n "✅ COMPLETED" CLAUDE.md | wc -l
grep -n "Current.*Status" CLAUDE.md
grep -n "Known.*Issues" CLAUDE.md

# Identify long sections
echo "## Section Lengths"
awk '/^##[^#]/ {if (NR>1) print NR-start-1, section; section=$0; start=NR} END {print NR-start, section}' CLAUDE.md | sort -nr
```

### 2. Redundancy Detection

#### Common Redundancies
- Multiple status summaries
- Repeated issue descriptions
- Duplicate configuration examples
- Redundant command listings
- Overlapping implementation details

#### Pattern Recognition
```bash
# Find duplicate lines
sort CLAUDE.md | uniq -d

# Find similar sections
grep -A5 -B5 "Implementation Status" CLAUDE.md
```

### 3. Structure Optimization

#### Section Consolidation Rules

**Keep Separate**:
- Core type definitions
- API specifications  
- Current critical issues
- Development priorities

**Consolidate**:
- Multiple status summaries → Single source of truth
- Scattered issues → Unified tracking section
- Repeated examples → Reference section
- Old session logs → Archive files

**Remove**:
- Completed TODO items
- Resolved issues (after archiving)
- Outdated version information
- Redundant explanations

### 4. Token Efficiency

#### Before/After Patterns

**Before** (Verbose):
```markdown
### Module: @crumb/core ✅ COMPLETED

**Purpose**: Core shared functionality including TypeScript interfaces, shared utilities, and common constants used across all packages in the monorepo.

**Status**: ✅ COMPLETED - All type definitions implemented with comprehensive JSDoc documentation. Includes full type system for crumbs, contexts, API responses, and common types. Utilities for date formatting and validation are complete.

**Dependencies**: No external dependencies, only TypeScript for type definitions.

**Key Features Implemented**:
- Complete type definitions in crumb.types.ts
- Context type system in context.types.ts
- API types in api.types.ts
- Common types in common.types.ts
- Date utilities in date.utils.ts
- Validation utilities in validation.utils.ts
- Comprehensive constants in constants.ts
```

**After** (Optimized):
```markdown
### @crumb/core ✅
Core types and utilities. See `/packages/@crumb/core/`.
- Types: crumb, context, api, common
- Utils: date, validation
- No external dependencies
```

### 5. Archive Strategy

#### Archive Structure
```
docs/ARCHIVE/
├── 2025-06-04-2000-versioning-system.md
├── 2025-06-04-1448-integration-testing.md
├── implementation-logs/
│   ├── core-implementation.md
│   ├── storage-implementation.md
│   └── api-implementation.md
└── resolved-issues/
    ├── 2025-06-critical-issues.md
    └── 2025-05-technical-debt.md
```

#### Archive Criteria
- Session logs older than 1 week
- Resolved issues older than 1 month
- Superseded documentation
- Historical implementation details

## Optimization Templates

### Compact Module Status
```markdown
## Module Status
| Package | Version | Status | Tests | Issues |
|---------|---------|--------|-------|--------|
| @crumb/core | 0.2.0 | ✅ | ❌ | None |
| @crumb/storage | 0.1.1 | ✅ | ✅ 30/30 | None |
| @crumb/api | 0.2.0 | ✅ | ❌ | None |
| @crumb/cli | 0.2.0 | ✅ | ❌ | Help overflow |
```

### Consolidated Issues
```markdown
## Known Issues
- **P1**: CLI help overflow [@crumb/cli]
- **P1**: HTTPS default needed [@crumb/cli]  
- **P2**: Missing tests [@crumb/core, @crumb/api]
- **P3**: No collectors implemented
```

### Reference Links
```markdown
## Quick References
- Types: `/packages/@crumb/core/src/types/`
- API Routes: `/packages/@crumb/api/src/routes/`
- CLI Commands: `/packages/@crumb/cli/src/commands/`
- Full History: `git log --oneline`
```

## Cleanup Actions

### 1. Remove Completed Items
```bash
# Remove completed TODOs
sed -i '/- \[x\]/d' CLAUDE.md

# Remove old session timestamps
sed -i '/Session started:/d' CLAUDE.md
```

### 2. Consolidate Sections
```bash
# Merge status sections
awk '/Status|STATE|state/ {print NR, $0}' CLAUDE.md

# Combine issue lists
grep -n "Issues\|ISSUES\|issues" CLAUDE.md
```

### 3. Update Table of Contents
```markdown
## Quick Navigation
- [Current Status](#current-status) - Line 50
- [Active Issues](#active-issues) - Line 150  
- [Module Specs](#modules) - Line 300
- [API Reference](#api) - Line 800
- [Dev Workflow](#workflow) - Line 1200
```

## AI Memory Notes

**Optimization Log**:
```yaml
last_optimized: [timestamp]
original_size: [bytes]
optimized_size: [bytes]
reduction: [percentage]
sections_consolidated:
  - [section_name]: [lines_removed]
sections_archived:
  - [section_name]: [archive_path]
tokens_saved: [estimate]
```

**Optimization Patterns**:
- Most redundant: Status summaries
- Most verbose: Implementation details
- Most outdated: Session logs
- Best for archiving: Resolved issues

## Quality Checks

### Post-Optimization Validation
- [ ] All critical information preserved
- [ ] Links and references still valid
- [ ] No broken markdown formatting
- [ ] Archive files properly linked
- [ ] TOC matches new structure
- [ ] Key sections easily findable

### Token Efficiency Metrics
```bash
# Before optimization
BEFORE=$(wc -c < CLAUDE.md)

# After optimization  
AFTER=$(wc -c < CLAUDE.md)

# Calculate savings
SAVED=$((BEFORE - AFTER))
PERCENT=$((SAVED * 100 / BEFORE))

echo "Saved $SAVED bytes ($PERCENT%)"
```

## Automation Script

```bash
#!/bin/bash
# blueprint_optimizer.sh

echo "=== Blueprint Optimization ==="

# Backup current spec
cp CLAUDE.md CLAUDE.md.backup

# Archive old content
mkdir -p docs/ARCHIVE/$(date +%Y-%m-%d)
./archive_old_content.sh

# Consolidate sections
./consolidate_status.sh
./merge_issues.sh
./compress_modules.sh

# Update TOC
./generate_toc.sh > new_toc.md

# Generate summary
echo "## Optimization Complete"
echo "Original: $(wc -l < CLAUDE.md.backup) lines"
echo "Optimized: $(wc -l < CLAUDE.md) lines"
echo "Reduction: $(($(wc -l < CLAUDE.md.backup) - $(wc -l < CLAUDE.md))) lines"
```

## Best Practices

1. **Preserve Critical Info**: Never delete unresolved issues or current blockers
2. **Maintain History**: Archive rather than delete
3. **Keep Navigation**: Update TOC and quick links
4. **Test Changes**: Verify markdown renders correctly
5. **Document Changes**: Note what was moved/removed

## Example Optimization

### Before (2500 lines)
```
- Redundant status sections (5 different summaries)
- Old session logs inline (500+ lines)
- Duplicate issue descriptions
- Verbose module descriptions
- Repeated configuration examples
```

### After (1200 lines)
```
- Single status matrix
- Session logs archived with links
- Consolidated issue tracker
- Compact module references
- Linked configuration docs
```

### Result
- 52% size reduction
- Faster AI processing
- Easier navigation
- Preserved all critical info
- Better organization