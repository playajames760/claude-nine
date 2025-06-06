# Accuracy Synchronizer 🎯

## Purpose & Overview
Updates project documentation to match actual implementation state, ensuring specs stay accurate and reliable for team collaboration and future development.

**🎯 New to this?** Think of this like keeping your project's "instruction manual" up-to-date with what you've actually built. When code changes but docs don't, confusion follows!

## When to Run
**Use this command when:**
- ✅ After running implementation validator (follow-up step)
- ✅ After major development sessions (end-of-day cleanup)
- ✅ When merging branches or pull requests (pre-merge requirement)
- ✅ Before planning new features (to know current state)
- ✅ Weekly maintenance (keep everything fresh)

**⚠️ Don't run this when:**
- ❌ No implementation changes have been made
- ❌ During active development (wait for stable state)
- ❌ Before running tests (sync after everything works)

## Step-by-Step Synchronization Process

### Step 1: Gather Validation Data
**Research phase - Collect current reality**

```bash
# REQUIRED: Get validation results first
/implementation-validator
cat .claude/validation_results.md

# REQUIRED: Check current package versions
echo "=== Current Package Versions ==="
for pkg in packages/@crumb/*/package.json; do
  echo "$(dirname $pkg): $(grep '\"version\"' $pkg)"
done

# REQUIRED: Get recent development history
echo "=== Recent Development ==="
git log --oneline -10 --grep="feat\|fix\|chore"

# OPTIONAL: Get test coverage if available
npm test -- --coverage --coverageReporters=text-summary 2>/dev/null || echo "No test coverage available"
```

**Success Criteria**: You should have clear data on current versions, recent changes, and test status before proceeding.

### Step 2: Update Module Status
**Plan phase - Categorize current state**

**Use these EXACT status markers:**
- ✅ **COMPLETED** - Fully implemented, tested, working in production
- ✅ **COMPLETED (with known issues)** - Working but has documented problems  
- 🚧 **IN PROGRESS** - Partially implemented, actively being developed
- 🚧 **NOT STARTED** - No implementation exists yet
- 🔧 **NEEDS UPDATE** - Implementation differs significantly from spec
- ❌ **BROKEN** - Was working but now fails

**Template for each module:**
```markdown
### Module: @crumb/[name] [STATUS]

**Current Version**: [exact version from package.json]
**Last Updated**: [git log date for this module]
**Test Coverage**: [X% or "Not measured"]
**Dependencies**: [list current dependencies with versions]

**Implementation Status**:
- ✅ [Specific completed feature with evidence]
- 🚧 [Specific in-progress feature with details]
- ❌ [Specific broken/missing feature]

**Known Issues**:
- [Issue description] - [GitHub issue # or commit reference]
- [Issue description] - [Link to solution or workaround]
```

### Step 3: Synchronize Critical Sections
**Implement phase - Update documentation systematically**

#### A. Package Versions Section
```bash
# Generate current versions automatically
echo "## Current Package Versions - Updated $(date +%Y-%m-%d)"
for pkg in packages/@crumb/*/; do
  if [ -f "$pkg/package.json" ]; then
    name=$(grep '"name"' "$pkg/package.json" | cut -d'"' -f4)
    version=$(grep '"version"' "$pkg/package.json" | cut -d'"' -f4)
    echo "- **$name**: $version"
  fi
done
```

#### B. Dependencies Matrix
```bash
# Extract and format dependencies
echo "## Actual Dependencies Matrix"
for pkg in packages/@crumb/*/; do
  if [ -f "$pkg/package.json" ]; then
    echo "### $(basename $pkg)"
    echo "```json"
    grep -A20 '"dependencies"' "$pkg/package.json" | grep '":' | grep -v dependencies
    echo "```"
  fi
done
```

#### C. Integration Status Matrix
**Update based on actual testing results:**
```markdown
### Integration Status Matrix - Updated [DATE]

| From | To | Status | Test Evidence | Notes |
|------|-----|--------|---------------|-------|
| CLI | API | ✅ Working | `npm test api-integration` passes | JWT auth configured |
| API | Storage | ✅ Working | All CRUD endpoints tested | Supabase connected |
| Storage | Database | 🔧 Needs Update | Connection timeouts observed | Issue #123 |
| CLI | Storage | ❌ Not Direct | No direct tests exist | Must go via API |
```

### Step 4: Move Issues Between Tracking Sections
**Verify phase - Reorganize based on current state**

#### Current Critical Issues
**Only include issues actively blocking development:**
```markdown
### 🔥 Current Critical Issues

**[Issue Name]** - Priority: [High/Critical]
- **Impact**: [What this breaks or prevents]
- **Evidence**: [Error messages, failed tests, user reports]
- **Assigned**: [Who's working on it]
- **Timeline**: [Expected resolution]
- **Workaround**: [Temporary solution if available]
```

#### Recently Resolved
**Move completed items here with full details:**
```markdown
### ✅ Recently Resolved - [Date Range]

**[Issue Name]** - RESOLVED [exact date]
- **Problem**: [Original description]
- **Root Cause**: [What actually caused it]
- **Solution**: [Specific steps taken]
- **Commit**: [full commit hash and message]
- **Impact**: [What this fixes/enables]
- **Verification**: [How we confirmed the fix]
```

#### Known Limitations
**Document accepted technical debt:**
```markdown
### ⚠️ Known Limitations

**[Limitation Name]**
- **Description**: [What doesn't work as expected]
- **Workaround**: [How users can avoid/work around it]
- **Plan**: [When/how this will be addressed]
- **Priority**: [Low/Medium - why this is acceptable for now]
```

## Quality Assurance & Verification

### Before Committing Changes
**MUST complete these verification steps:**

1. **Diff Review**: `git diff` - Review all changes for accuracy
2. **Link Verification**: Test that all referenced issues/commits exist
3. **Consistency Check**: Ensure status markers match across all sections
4. **Evidence Validation**: Confirm all claims have supporting evidence
5. **Format Check**: Verify markdown renders correctly

### Success Criteria Checklist
**All items must be ✅ before considering sync complete:**

- [ ] All module versions match `package.json` exactly
- [ ] All status changes have supporting evidence (commits, tests, issues)
- [ ] No "TODO" or placeholder text remains
- [ ] All links to issues/commits are valid
- [ ] Integration matrix reflects actual test results
- [ ] Issue movements include resolution details
- [ ] Timestamps are current and accurate

## Automation & Efficiency

### Quick Sync Commands
```bash
# Full synchronization
/accuracy-synchronizer

# Version sync only (fastest)
/accuracy-synchronizer --versions-only

# Issue status sync only
/accuracy-synchronizer --issues-only

# Test coverage sync
/accuracy-synchronizer --coverage-only

# Verify sync accuracy
/accuracy-synchronizer --verify
```

### Spec Section Line References
**Know where to make updates:**
- **Lines 150-300**: Module implementation status
- **Lines 400-600**: API endpoints and integration
- **Lines 800-1000**: Current package versions
- **Lines 1100-1300**: Issue tracking sections
- **Lines 1400+**: Development logs and history

## Learning & Best Practices

### 🎓 Beginner Tips
- **Start small**: Sync one module at a time when learning
- **Use evidence**: Always include commit hashes, test results, or issue numbers
- **Be specific**: "Login broken" → "JWT authentication fails with 401 error"
- **Date everything**: Future you will thank present you

### 🚀 Advanced Techniques
- **Batch updates**: Group related changes for cleaner commits
- **Cross-reference**: Link related issues and commits
- **Trend tracking**: Note patterns in what frequently gets out of sync
- **Automation**: Use git hooks to remind about sync after major changes

### ⚠️ Common Mistakes to Avoid
- **Don't delete history**: Move old items to archive sections
- **Don't sync during active development**: Wait for stable states
- **Don't make assumptions**: Verify every claim with evidence
- **Don't skip verification**: Always test links and references

## Example Synchronization Report

```markdown
## Sync Report - 2024-12-06

### Summary
Updated 3 modules, resolved 2 critical issues, moved 4 items between tracking sections.

### Changes Made
1. **@crumb/cli** (lines 610-615)
   - Status: "COMPLETED" → "COMPLETED (with known issues)"
   - Added reference to stack overflow bug #156
   - Updated version: 0.1.0 → 0.1.2

2. **@crumb/storage** (lines 650-655)
   - Status: "IN PROGRESS" → "COMPLETED"
   - Added test coverage: 85% (42/49 tests passing)
   - Dependencies updated: added @supabase/supabase-js@2.38.0

3. **Current Critical Issues** (lines 1191-1202)
   - Moved "ES Module Compatibility" → Recently Resolved
   - Added "JWT Token Refresh" from new bug report #159
   - Updated priority for "Database Connection Pool" → High

### Verification Completed
- ✅ All version numbers verified against package.json
- ✅ All commit references tested and valid
- ✅ All issue links confirmed active
- ✅ Integration matrix matches test results
- ✅ No broken markdown or formatting

### Next Actions Needed
- [ ] Run integration analyzer on updated spec
- [ ] Update critical path based on new module statuses
- [ ] Schedule follow-up sync after JWT fix deployment
```

## Advanced Integration

### Memory Notes for AI Assistants
```yaml
sync_metadata:
  last_sync: 2024-12-06T14:30:00Z
  spec_version: 1.4.2
  modules_updated: ["cli", "storage", "api"]
  issues_resolved: 2
  issues_added: 1
  next_sync_needed: "After JWT token refresh fix"

patterns_observed:
  frequent_drift:
    - "CLI module status often lags reality"
    - "Test coverage numbers become stale quickly"
  reliable_sections:
    - "API endpoints rarely change"
    - "Database schema stable"
  sync_triggers:
    - "Version bumps"
    - "Major feature completion"
    - "Bug fix deployments"
```

### Integration with Other Tools
```bash
# Run after implementation validator
/implementation-validator && /accuracy-synchronizer

# Run before critical path planning
/accuracy-synchronizer && /critical-path-tracker

# Full project health check
/accuracy-synchronizer && /integration-analyzer && /blueprint-optimizer
```

---

**🎯 Remember**: The goal is accuracy, not perfection. Regular small syncs beat massive occasional updates. Your documentation should tell the truth about your code, not an idealized version!

**⚡ Pro tip**: Set up a weekly reminder to run this - future developers (including yourself) will thank you for accurate, up-to-date documentation.