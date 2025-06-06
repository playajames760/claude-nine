# Accuracy Synchronizer

## Purpose
Updates spec based on validation results and current reality, aligning documentation with actual implementation state.

## When to Run
- After running implementation validator
- After major development sessions
- When merging branches or pull requests
- Before planning new features

## Synchronization Process

### 1. Gather Validation Results
Read output from implementation validator and identify discrepancies:

```bash
# Review validator output
cat validation_results.md

# Check current package versions
for pkg in packages/@crumb/*/package.json; do
  echo "$(dirname $pkg): $(grep '"version"' $pkg)"
done

# Get latest commit info
git log --oneline -10 --grep="feat\|fix\|chore"
```

### 2. Update Completion Status

#### Status Markers to Use
- ✅ **COMPLETED** - Fully implemented, tested, and working
- ✅ **COMPLETED (with known issues)** - Working but has documented problems
- 🚧 **IN PROGRESS** - Partially implemented
- 🚧 **NOT STARTED** - No implementation exists
- 🔧 **NEEDS UPDATE** - Implementation differs from spec

### 3. Synchronize Sections

#### Package Versions
```bash
# Extract current versions
echo "## Current Package Versions"
for pkg in packages/@crumb/*/; do
  if [ -f "$pkg/package.json" ]; then
    name=$(grep '"name"' "$pkg/package.json" | cut -d'"' -f4)
    version=$(grep '"version"' "$pkg/package.json" | cut -d'"' -f4)
    echo "- $name: $version"
  fi
done
```

#### Dependencies
```bash
# Update dependency lists
echo "## Actual Dependencies"
for pkg in packages/@crumb/*/; do
  if [ -f "$pkg/package.json" ]; then
    echo "### $(basename $pkg)"
    grep -A20 '"dependencies"' "$pkg/package.json" | grep '":' | grep -v dependencies
  fi
done
```

#### Test Coverage
```bash
# Get test statistics
echo "## Test Coverage Status"
npm test -- --coverage --coverageReporters=text-summary
```

### 4. Update Issue Tracking

Move items between sections based on current state:

#### Current Critical Issues
- Issues blocking development
- Failures in "completed" features
- Security vulnerabilities
- Performance problems

#### Recently Resolved
- Fixed in last session
- Include commit hash
- Note resolution approach

#### Known Limitations
- Documented workarounds
- Planned future fixes
- Acceptable technical debt

### 5. Integration Status Updates

Update integration points based on actual testing:

```markdown
### Integration Status Matrix

| From | To | Status | Notes |
|------|-----|--------|-------|
| CLI | API | ✅ Working | JWT auth configured |
| API | Storage | ✅ Working | All routes connected |
| Storage | Database | ✅ Working | Supabase connected |
| CLI | Storage | ❌ Not Direct | Via API only |
```

## Synchronization Templates

### Module Status Update
```markdown
### Module: @crumb/[name] [STATUS]

**Current Version**: [from package.json]
**Last Updated**: [git log date]
**Test Coverage**: [X%]

**Implementation Status**:
- ✅ [Completed feature]
- 🚧 [In progress feature]
- ❌ [Not implemented]

**Known Issues**:
- [Issue description] - [GitHub issue #]

**Dependencies**:
- [package]: [version]
```

### Issue Movement Template
```markdown
### 🔧 Current Critical Issues -> ✅ Recently Resolved

**[Issue Name]** - RESOLVED [date]
- **Problem**: [description]
- **Solution**: [what was done]
- **Commit**: [hash]
- **Impact**: [what this fixes]
```

## AI Memory Notes

**Synchronization Log**:
```yaml
last_sync: [timestamp]
spec_version: [version]
major_updates:
  - section: [name]
    change: [description]
  - section: [name]
    change: [description]
discrepancies_remaining:
  - [list of unresolved differences]
next_sync_needed: [when/why]
```

**Patterns Observed**:
- Common drift areas: [list]
- Frequently outdated sections: [list]
- Reliable sections: [list]

## Automation Hints

### Quick Sync Commands
```bash
# Full sync
./accuracy_synchronizer.sh

# Version sync only
./accuracy_synchronizer.sh --versions

# Issue sync only
./accuracy_synchronizer.sh --issues

# Test coverage sync
./accuracy_synchronizer.sh --coverage
```

### Spec Section Mappings
- Line 150-300: Module implementation status
- Line 400-600: API endpoints
- Line 1100-1300: Current issues
- Line 1400+: Development logs

## Example Synchronization

```markdown
## Sync Report - [Date]

### Updated Sections
1. **Module Status** (lines 610-615)
   - Changed CLI from "COMPLETED" to "COMPLETED (with known issues)"
   - Added stack overflow bug reference

2. **Current Package Versions** (lines 605-609)
   - Updated @crumb/api from 0.1.0 to 0.2.0
   - Updated @crumb/storage from 0.1.0 to 0.1.1

3. **Issue Tracking** (lines 1191-1202)
   - Moved "ES Module Compatibility" to Recently Resolved
   - Added "CLI Help Command Stack Overflow" to Critical Issues

4. **Test Coverage** (lines 1268-1274)
   - Updated storage tests from "planned" to "30/30 passing"
   - Added integration test suite status

### Remaining Discrepancies
- [ ] Collector modules marked as planned but not started
- [ ] AI module timeline needs update
- [ ] Web dashboard not mentioned in recent sections
```

## Best Practices

1. **Preserve History**: Don't delete, move to archive sections
2. **Use Timestamps**: Always date major updates
3. **Link Evidence**: Reference commits, PRs, issues
4. **Keep Diffs Small**: Update incrementally
5. **Leave Notes**: Explain why changes were made

## Next Steps
After synchronization:
1. Commit spec updates with descriptive message
2. Run integration analyzer on updated spec
3. Update critical path based on new status
4. Consider blueprint optimization if spec is cluttered