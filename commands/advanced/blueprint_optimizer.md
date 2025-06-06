# Blueprint Optimizer 🧹

## Purpose
Systematically optimize CLAUDE.md and project documentation by removing redundancy, consolidating sections, and improving AI token efficiency while preserving all critical information.

## When to Use This Command
**Use `/blueprint-optimizer` when:**
- CLAUDE.md exceeds 2000 lines or feels cluttered
- Multiple duplicate status sections exist
- Token usage warnings appear in Claude Code
- After completing major development phases
- Before sharing project documentation
- When navigation becomes difficult due to file size

**Specific triggers:**
- File size > 100KB
- Multiple "Status" or "Implementation" sections
- Completed todos mixed with active ones
- Old session logs inline (not archived)
- Repetitive configuration examples

## Step-by-Step Optimization Process

### Step 1: Analyze Current State
**Goal: Understand what needs optimization**

**Commands to run:**
```bash
# Get baseline metrics
echo "=== CLAUDE.md Analysis ==="
wc -l CLAUDE.md && du -h CLAUDE.md

# Count redundant patterns
echo "Completed items: $(grep -c "✅ COMPLETED" CLAUDE.md)"
echo "Status sections: $(grep -c "Status\|STATE" CLAUDE.md)"
echo "Issue sections: $(grep -c "Issues\|ISSUES" CLAUDE.md)"

# Find longest sections
awk '/^##[^#]/ {if (NR>1) print NR-start-1, section; section=$0; start=NR} END {print NR-start, section}' CLAUDE.md | sort -nr | head -10
```

**Expected output:** File size, line count, and identification of redundant sections.

**Success criteria:** Clear understanding of optimization targets (sections >100 lines, duplicate patterns, completed items).

### Step 2: Identify Redundancies
**Goal: Find duplicate and unnecessary content**

**Commands to run:**
```bash
# Find exact duplicate lines
echo "=== Duplicate Lines ==="
sort CLAUDE.md | uniq -d | head -10

# Find similar section headers
echo "=== Similar Headers ==="
grep -n "Status\|Implementation\|Issues\|TODO" CLAUDE.md

# Count repetitive patterns
echo "Completed checkboxes: $(grep -c "\[x\]" CLAUDE.md)"
echo "Session timestamps: $(grep -c "Session started\|Last updated" CLAUDE.md)"
```

**What to look for:**
- ✅ Multiple status summaries in different sections
- ✅ Repeated issue descriptions across sections  
- ✅ Duplicate configuration examples
- ✅ Old session logs mixed with current info
- ✅ Completed TODOs still listed with active ones

**Success criteria:** Identified at least 3 categories of redundant content to consolidate.

### Step 3: Create Optimization Plan
**Goal: Decide exactly what to consolidate, archive, and remove**

**Critical preservation rules:**
```yaml
NEVER_REMOVE:
  - Core type definitions and interfaces
  - API specifications and routes
  - Current critical issues (unresolved)
  - Active development priorities
  - Current configuration settings
  - Essential troubleshooting info
```

**Consolidation strategy:**
```yaml
CONSOLIDATE:
  multiple_status_sections: → "## Current Status" (single table)
  scattered_issues: → "## Known Issues" (prioritized list)  
  repeated_examples: → "## Quick Reference" (linked docs)
  session_logs: → Archive with date stamps
  
ARCHIVE:
  completed_todos: → docs/ARCHIVE/completed-YYYY-MM-DD.md
  resolved_issues: → docs/ARCHIVE/resolved-YYYY-MM-DD.md
  old_sessions: → docs/ARCHIVE/sessions/YYYY-MM-DD-HHMM.md
  superseded_docs: → docs/ARCHIVE/legacy/

REMOVE_COMPLETELY:
  duplicate_lines: Sort and deduplicate
  empty_sections: Headers with no content
  outdated_versions: Version info >1 month old
  broken_links: Links to non-existent files
```

**Success criteria:** Clear plan for each section - consolidate, archive, or remove.

### Step 4: Apply Token-Efficient Patterns
**Goal: Reduce verbosity while preserving essential information**

**Transformation examples:**

**❌ VERBOSE (23 lines, ~400 tokens):**
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

**✅ OPTIMIZED (6 lines, ~60 tokens):**
```markdown
### @crumb/core ✅
Core types and utilities. See `/packages/@crumb/core/`.
- Types: crumb, context, api, common
- Utils: date, validation
- No external dependencies
```

**Token efficiency rules:**
- ✅ Use tables instead of verbose lists
- ✅ Link to detailed docs rather than inline everything
- ✅ Remove redundant status confirmations 
- ✅ Consolidate similar information
- ✅ Use concise bullet points vs paragraphs

### Step 5: Execute Archival Process
**Goal: Move historical content to organized archive structure**

**First, create archive directories:**
```bash
# Create archive structure
mkdir -p docs/ARCHIVE/{sessions,completed,resolved,legacy}
mkdir -p docs/ARCHIVE/sessions/$(date +%Y-%m)
```

**Archive these items (DO NOT DELETE):**
```bash
# Archive completed items
grep -n "\[x\]" CLAUDE.md > docs/ARCHIVE/completed/$(date +%Y-%m-%d)-todos.md

# Archive resolved issues (those marked as fixed/resolved)
grep -A10 -B2 "RESOLVED\|FIXED\|COMPLETED.*Issue" CLAUDE.md > docs/ARCHIVE/resolved/$(date +%Y-%m-%d)-issues.md

# Archive old session logs
grep -A20 -B2 "Session started\|Last updated.*ago" CLAUDE.md > docs/ARCHIVE/sessions/$(date +%Y-%m)/session-$(date +%d-%H%M).md
```

**Archive criteria:**
- ✅ Session logs older than 7 days
- ✅ Issues marked resolved/fixed >30 days ago  
- ✅ Completed TODOs older than 14 days
- ✅ Superseded documentation versions
- ✅ Historical implementation logs

**Always include archive links in CLAUDE.md:**
```markdown
## Archive Links
- [Completed Items](docs/ARCHIVE/completed/)
- [Resolved Issues](docs/ARCHIVE/resolved/) 
- [Session History](docs/ARCHIVE/sessions/)
- [Legacy Docs](docs/ARCHIVE/legacy/)
```

## Step 6: Apply Optimized Templates

### Template 1: Compact Status Table
**Replace multiple status sections with this single table:**
```markdown
## Current Project Status
| Component | Version | Status | Tests | Priority Issues |
|-----------|---------|--------|-------|----------------|
| @crumb/core | 0.2.0 | ✅ Complete | ❌ Missing | None |
| @crumb/storage | 0.1.1 | ✅ Complete | ✅ 30/30 | None |
| @crumb/api | 0.2.0 | ✅ Complete | ❌ Missing | None |
| @crumb/cli | 0.2.0 | ⚠️ Issues | ❌ Missing | Help overflow |
```

### Template 2: Prioritized Issues List
**Consolidate all issue sections into one prioritized list:**
```markdown
## Active Issues
- **P1 Critical**: CLI help overflow [Fix in @crumb/cli] 
- **P1 Critical**: HTTPS default needed [Add to @crumb/cli config]
- **P2 Important**: Missing tests [@crumb/core, @crumb/api] 
- **P3 Enhancement**: No collectors implemented [Future feature]

[View resolved issues](docs/ARCHIVE/resolved/)
```

### Template 3: Quick Navigation
**Replace verbose documentation with concise reference links:**
```markdown
## Quick References
| What | Where | Last Updated |
|------|-------|--------------|
| Type Definitions | `/packages/@crumb/core/src/types/` | 2025-06-04 |
| API Endpoints | `/packages/@crumb/api/src/routes/` | 2025-06-04 |
| CLI Commands | `/packages/@crumb/cli/src/commands/` | 2025-06-03 |
| Development Log | `git log --oneline` | Real-time |
| Full Documentation | [docs/](docs/) | 2025-06-04 |
```

**Usage instructions:**
1. Replace existing verbose sections with these templates
2. Update the information to match your project
3. Keep templates at the top of CLAUDE.md for easy access
4. Link to detailed docs rather than duplicating content

## Step 7: Execute Final Cleanup

### Final Cleanup Commands
**Run these commands to complete the optimization:**

```bash
# 1. Backup original file
cp CLAUDE.md CLAUDE.md.backup-$(date +%Y%m%d-%H%M)

# 2. Remove completed TODOs (after archiving)
sed -i '/- \[x\]/d' CLAUDE.md

# 3. Remove old session timestamps  
sed -i '/Session started.*ago\|Last updated.*ago/d' CLAUDE.md

# 4. Remove empty sections
sed -i '/^##.*$/N;/^##.*\n$/d' CLAUDE.md

# 5. Remove duplicate blank lines
sed -i '/^$/N;/^\n$/d' CLAUDE.md
```

### Verification Checklist
**After cleanup, verify these requirements:**

- [ ] ✅ **Critical info preserved**: All unresolved issues, current priorities, and active development info remains
- [ ] ✅ **Archive links working**: All archived content is properly linked and accessible
- [ ] ✅ **Markdown valid**: File renders correctly with no broken formatting
- [ ] ✅ **Navigation updated**: Table of contents reflects new structure
- [ ] ✅ **File size reduced**: Significant reduction in lines/tokens while preserving value
- [ ] ✅ **Easy to find info**: Key sections are clearly marked and easily accessible

### Generate New Table of Contents
```markdown
## Quick Navigation 
| Section | Content | Line |
|---------|---------|------|
| [Current Status](#current-project-status) | Project overview | ~50 |
| [Active Issues](#active-issues) | Priority issues | ~100 |
| [Quick References](#quick-references) | Code locations | ~150 |
| [Archive Links](#archive-links) | Historical data | ~200 |
```

## Step 8: Measure Success

### Calculate Optimization Results
```bash
# Compare file sizes
echo "=== Optimization Results ==="
BEFORE=$(wc -c < CLAUDE.md.backup-*)
AFTER=$(wc -c < CLAUDE.md)
SAVED=$((BEFORE - AFTER))
PERCENT=$((SAVED * 100 / BEFORE))

echo "Original: $BEFORE bytes"
echo "Optimized: $AFTER bytes" 
echo "Saved: $SAVED bytes ($PERCENT%)"

# Line count comparison
echo "Original lines: $(wc -l < CLAUDE.md.backup-*)"
echo "Optimized lines: $(wc -l < CLAUDE.md)"
```

### Document Optimization Results
**Add this section to the top of your optimized CLAUDE.md:**
```markdown
## Last Optimization
- **Date**: $(date +%Y-%m-%d)
- **Size reduction**: [X]% (from [Y] to [Z] bytes)
- **Archived items**: [N] completed todos, [M] resolved issues  
- **Backup**: CLAUDE.md.backup-YYYYMMDD-HHMM
- **Next optimization**: When file exceeds 2000 lines or gets cluttered
```

### Success Criteria Met?
- ✅ **30%+ size reduction** achieved
- ✅ **All critical info preserved** (no lost unresolved issues)
- ✅ **Archive structure created** with proper links
- ✅ **Navigation improved** with clear table of contents
- ✅ **Token efficiency** increased through templates and consolidation
- ✅ **Maintainability** improved for future updates

**If criteria not met:** Review steps 1-7 and identify what can be further optimized.

## Example Results

### Real Optimization Example

**Before optimization:**
- **File size**: 125KB (2,847 lines)
- **Issues**: 15 different status sections, 45 completed TODOs mixed with active ones, 500+ lines of old session logs
- **Problems**: Difficult to find current info, high token usage, redundant content

**After optimization:**
- **File size**: 58KB (1,384 lines) 
- **Reduction**: 53% smaller, 1,463 lines removed
- **Improvements**: Single status table, archived completed items, consolidated issues, clear navigation

**What was moved:**
- ✅ 45 completed TODOs → `docs/ARCHIVE/completed/2025-06-04-todos.md`
- ✅ 12 resolved issues → `docs/ARCHIVE/resolved/2025-06-04-issues.md`  
- ✅ Session logs → `docs/ARCHIVE/sessions/2025-06/`
- ✅ 5 duplicate status sections → 1 optimized table

**Preserved completely:**
- ✅ All 8 active critical issues
- ✅ Current development priorities  
- ✅ API specifications and type definitions
- ✅ Configuration settings and troubleshooting info

## Usage Examples & Best Practices

### Slash Command Usage
```
/blueprint-optimizer
```
**Claude will then:**
1. Analyze your CLAUDE.md for optimization opportunities
2. Create archive directories and backup files
3. Consolidate redundant sections using the templates above
4. Generate optimized tables and navigation
5. Provide before/after metrics

### Natural Language Usage
```
"My CLAUDE.md is getting really long and messy. Help me clean it up by moving old completed items to archives and consolidating the duplicate status sections. Make sure to preserve all the current issues and development priorities."
```

### Best Practices for Beginners

#### ✅ DO
- **Always backup first** - The optimization process creates automatic backups
- **Archive, don't delete** - Historical info goes to organized archive folders
- **Preserve active work** - Never remove unresolved issues or current priorities
- **Update regularly** - Run optimization every 2-3 weeks or when file gets unwieldy
- **Verify results** - Check that all important information is still accessible

#### ❌ DON'T  
- **Don't remove unfinished work** - Only archive completed/resolved items
- **Don't break links** - Always update references when moving content
- **Don't optimize too frequently** - Let the file accumulate some content first
- **Don't skip verification** - Always check that critical info is preserved

### When to Re-run Optimization
- File exceeds 2000 lines again
- Multiple new status sections have been added
- Completed work is mixing with active work
- Finding information becomes difficult
- Token usage warnings appear in Claude Code