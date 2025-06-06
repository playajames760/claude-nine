# Spec File Migration

## Purpose
Migrate existing project specification files to the CLAUDE.md format and update all references throughout the project.

## When to Run
- When installing Claude Nine in an existing project
- When switching from other specification formats
- When consolidating multiple spec files
- When adopting CLAUDE.md as your project's primary specification file

## Common Spec Files to Migrate
The following files commonly serve as project specifications:
- `SPEC.md`
- `spec.md` 
- `PROJECT_SPEC.md`
- `project-spec.md`
- `specification.md`
- `SPECIFICATION.md`
- `requirements.md`
- `REQUIREMENTS.md`
- `design.md`
- `DESIGN.md`
- `README.spec.md`
- `docs/spec.md`
- `docs/SPEC.md`
- `.spec.md`

## Migration Process

### 1. Find Existing Spec Files
```bash
# Search for common spec file patterns
find . -maxdepth 3 \( -name "*spec*.md" -o -name "*SPEC*.md" -o -name "*specification*.md" -o -name "*requirements*.md" -o -name "*design*.md" \) -type f
```

### 2. Backup Original Files
Create a backup before making changes:
```bash
# Create backup directory with timestamp
mkdir -p ./spec-migration-backup-$(date +%Y%m%d_%H%M%S)

# Copy all spec files to backup
cp SPEC.md spec.md requirements.md ./spec-migration-backup-*/
```

### 3. Migrate Content to CLAUDE.md

#### For Single Spec File
If you have one primary spec file:
```bash
# Simply rename the file
mv SPEC.md CLAUDE.md

# Or copy if you want to keep the original
cp SPEC.md CLAUDE.md
```

#### For Multiple Spec Files
If you have multiple specification files, consolidate them:
```bash
# Create new CLAUDE.md with consolidated content
cat > CLAUDE.md << 'EOF'
# Project Specification (Claude Nine)

This file consolidates multiple specification files for use with Claude Code.

## Overview
[Add project overview here]

EOF

# Append content from existing files
echo "## Requirements (from requirements.md)" >> CLAUDE.md
cat requirements.md >> CLAUDE.md
echo "" >> CLAUDE.md

echo "## Technical Specification (from SPEC.md)" >> CLAUDE.md  
cat SPEC.md >> CLAUDE.md
echo "" >> CLAUDE.md

echo "## Design Notes (from design.md)" >> CLAUDE.md
cat design.md >> CLAUDE.md
```

### 4. Update File References

#### Search for References
Find all files that reference the old spec files:
```bash
# Search for references to old spec files
grep -r "SPEC\.md\|spec\.md\|requirements\.md\|design\.md" . --include="*.md" --include="*.txt" --include="*.js" --include="*.ts" --include="*.json"
```

#### Update References
Replace references in common file types:
```bash
# Update markdown files
find . -name "*.md" -exec sed -i 's/SPEC\.md/CLAUDE.md/g' {} \;
find . -name "*.md" -exec sed -i 's/spec\.md/CLAUDE.md/g' {} \;
find . -name "*.md" -exec sed -i 's/requirements\.md/CLAUDE.md/g' {} \;

# Update documentation files
find . -name "*.txt" -exec sed -i 's/SPEC\.md/CLAUDE.md/g' {} \;

# Update config files that might reference specs
find . -name "*.json" -exec sed -i 's/SPEC\.md/CLAUDE.md/g' {} \;
find . -name "*.yml" -o -name "*.yaml" -exec sed -i 's/SPEC\.md/CLAUDE.md/g' {} \;
```

### 5. Update Common Patterns

#### README Files
Update README.md references:
```bash
# Replace common specification references
sed -i 's/See SPEC\.md/See CLAUDE.md/g' README.md
sed -i 's/Read the spec/Read CLAUDE.md/g' README.md
sed -i 's/project specification/CLAUDE.md/g' README.md
```

#### Documentation Links
Update any documentation that links to specification files:
```bash
# Update relative links
sed -i 's|\[.*\](SPEC\.md)|\[Specification\](CLAUDE.md)|g' docs/*.md
sed -i 's|\[.*\](spec\.md)|\[Specification\](CLAUDE.md)|g' docs/*.md
```

## Validation Steps

### 1. Verify CLAUDE.md Content
- [ ] All important specification content is present
- [ ] File structure is logical and readable
- [ ] No duplicate sections from consolidation
- [ ] Markdown formatting is correct

### 2. Check References
- [ ] All links to CLAUDE.md work correctly
- [ ] No broken references to old spec files
- [ ] Documentation navigation still works
- [ ] Build/deployment scripts don't reference old files

### 3. Test Project Functionality
- [ ] Project builds successfully
- [ ] Tests pass
- [ ] Documentation generates correctly
- [ ] CI/CD pipelines work

## Cleanup

### Remove Old Files (After Verification)
Once you've verified the migration is successful:
```bash
# Remove old spec files (be careful!)
rm SPEC.md spec.md requirements.md design.md

# Or move them to archive
mkdir -p archive/old-specs
mv SPEC.md spec.md requirements.md archive/old-specs/
```

### Update .gitignore (Optional)
If you want to prevent accidental recreation of old spec files:
```bash
echo "# Prevent old spec file formats" >> .gitignore
echo "SPEC.md" >> .gitignore
echo "spec.md" >> .gitignore
```

## Example Migration

### Before Migration
```
project/
├── README.md
├── SPEC.md           # Main specification
├── requirements.md   # Requirements document
├── docs/
│   ├── api.md
│   └── setup.md      # References SPEC.md
└── package.json      # References SPEC.md in description
```

### After Migration
```
project/
├── README.md         # Updated to reference CLAUDE.md
├── CLAUDE.md         # Consolidated specification
├── docs/
│   ├── api.md
│   └── setup.md      # Updated to reference CLAUDE.md
├── package.json      # Updated description
└── spec-migration-backup-20250605_143022/
    ├── SPEC.md       # Backup of original
    └── requirements.md # Backup of original
```

## Troubleshooting

### Missing References
If you find references you missed:
```bash
# Find remaining references to old spec files
grep -r "SPEC\|spec" . --include="*.md" | grep -v CLAUDE.md
```

### Broken Links
If links are broken after migration:
```bash
# Check for broken markdown links
find . -name "*.md" -exec grep -l "\[.*\](.*\.md)" {} \; | xargs -I {} sh -c 'echo "Checking {}:" && grep "\[.*\](.*\.md)" {}'
```

### Content Issues
If CLAUDE.md has formatting issues:
- Check for duplicate headers from file consolidation
- Verify markdown syntax with a linter
- Ensure proper spacing between merged sections

## Best Practices

1. **Always Backup**: Create backups before starting migration
2. **Test Thoroughly**: Verify all references work after migration  
3. **Consolidate Wisely**: Don't just concatenate files - organize logically
4. **Update Documentation**: Ensure team knows about the change
5. **Commit Changes**: Use git to track the migration process

## AI Memory Notes

**Migration Checklist**:
- [ ] Backed up original files
- [ ] Created/updated CLAUDE.md
- [ ] Updated all file references
- [ ] Verified links work
- [ ] Tested project builds
- [ ] Cleaned up old files
- [ ] Updated team documentation

**Common Issues**:
- Case sensitivity in file references
- Hardcoded paths in build scripts
- Documentation that assumes old file names
- IDE/editor bookmarks to old files