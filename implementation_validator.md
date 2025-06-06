# Implementation Validator

## Purpose
Verifies what's actually built vs. what the spec claims, testing actual code against spec claims and flagging discrepancies.

## When to Run
- Before major sessions
- When implementation status seems unclear
- After pulling changes from repository
- When spec claims seem outdated

## Validation Process

### 1. Module Existence Check
First, verify that claimed modules actually exist:

```bash
# Check if all claimed packages exist
ls -la packages/@crumb/*/package.json 2>/dev/null || echo "Missing packages detected"

# Verify build outputs
ls -la packages/@crumb/*/dist/ 2>/dev/null || echo "Missing build outputs"
```

### 2. Dependency Verification
Cross-reference package.json dependencies with spec requirements:

```bash
# Check @crumb/core dependencies
cat packages/@crumb/core/package.json | grep -E '"dependencies"|"devDependencies"' -A 10

# Verify workspace dependencies
cat package.json | grep -E '"workspaces"' -A 5
```

### 3. API Endpoint Testing
Validate that claimed API endpoints actually exist and work:

```bash
# Test health endpoint
curl -s http://localhost:3000/api/health || echo "API not running"

# Test authentication
curl -s -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"test"}' || echo "Auth endpoint issue"
```

### 4. Build and Test Verification
Run builds and tests to verify implementations:

```bash
# Build all packages
npm run build

# Run all tests
npm test

# Check test coverage
npm run test:coverage
```

### 5. Git Commit Analysis
Cross-reference commits with completion markers:

```bash
# Find recent implementation commits
git log --oneline --grep="implement\|complete\|fix" -20

# Check for TODO/FIXME markers
grep -r "TODO\|FIXME\|HACK" packages/*/src/
```

## Validation Checklist

### Core Module (@crumb/core) ✓
- [ ] Package exists at `packages/@crumb/core`
- [ ] TypeScript interfaces in `src/types/*.ts`
- [ ] Utilities in `src/utils/*.ts`
- [ ] Constants defined in `src/constants.ts`
- [ ] Build output in `dist/`
- [ ] Proper exports in `index.ts`

### Storage Module (@crumb/storage) ✓
- [ ] Package exists at `packages/@crumb/storage`
- [ ] Supabase client configured
- [ ] Repository classes implemented
- [ ] Migrations in `migrations/`
- [ ] Tests passing (30/30 claimed)
- [ ] ES module compatibility (.js extensions)

### API Module (@crumb/api) ✓
- [ ] Package exists at `packages/@crumb/api`
- [ ] Fastify server starts successfully
- [ ] JWT authentication working
- [ ] All CRUD routes accessible
- [ ] Health endpoints responding
- [ ] OpenAPI documentation available

### CLI Module (@crumb/cli) ✓
- [ ] Package exists at `packages/@crumb/cli`
- [ ] Binary executable built
- [ ] Commands work (init, crumb, what, list)
- [ ] Configuration persists
- [ ] API client connects successfully

## Discrepancy Flags

### 🚨 Critical Issues
- Missing packages that are marked "COMPLETED"
- Non-functional endpoints claimed as working
- Test failures in "completed" modules
- Missing dependencies for claimed integrations

### ⚠️ Warnings
- Incomplete implementations marked as done
- Missing documentation for completed features
- Outdated version numbers in spec
- Unresolved TODO/FIXME in "completed" code

### 📝 Notes for Synchronizer
After validation, the accuracy synchronizer should update:
- Completion status based on actual state
- Version numbers from package.json files
- Dependency lists from actual installations
- Known issues from test failures
- Integration points from actual code

## AI Memory Notes

**Validation Results**: [To be filled by validator run]
- Last validated: [timestamp]
- Packages found: [list]
- Tests passing: [count]
- Endpoints working: [list]
- Major discrepancies: [list]

**Action Items for Next Session**:
- Update spec sections: [list]
- Fix broken implementations: [list]
- Complete partial work: [list]
- Resolve test failures: [list]

## Example Output

```markdown
## Validation Run - [Date]

### Summary
- ✅ 4/4 core packages exist
- ⚠️ 2 packages missing dist/ folders
- 🚨 CLI help command causes stack overflow
- ✅ 30/30 storage tests passing
- ⚠️ No tests for @crumb/core
- ✅ API endpoints accessible
- ⚠️ JWT auth needs configuration

### Discrepancies Found
1. **@crumb/cli** - Marked complete but has critical bug
2. **@crumb/core** - No tests despite spec claiming tested
3. **Integration** - API-Storage connection needs verification

### Recommended Updates
- Change CLI status to "COMPLETED (with issues)"
- Add test coverage metrics to spec
- Update integration status based on actual testing
```