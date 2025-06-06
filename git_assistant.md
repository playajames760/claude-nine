# Git Assistant - Claude Code Slash Commands

## Purpose
Git workflow helper commands for commits, branches, merge conflicts, and repository management. Save these as markdown files in `.claude/commands/git/` to use as slash commands.

## Setup
```bash
mkdir -p .claude/commands/git
# Save each command below as a .md file
# Example: save the smart-commit command as .claude/commands/git/smart-commit.md
# Usage in Claude: /project:git:smart-commit
```

## Commit Commands

### /project:git:smart-commit
File: `.claude/commands/git/smart-commit.md`
```markdown
Analyze the current changes using git diff and git status, then create a meaningful commit message following conventional commits format (feat:, fix:, docs:, style:, refactor:, test:, chore:). 

Group related changes appropriately and explain what the changes accomplish, not just what files were modified. If changes should be split into multiple commits, let me know.
```

### /project:git:commit-staged
File: `.claude/commands/git/commit-staged.md`
```markdown
Review the currently staged changes and create an appropriate commit message. Ensure the message:
- Follows our project's commit conventions
- Explains why the change was made, not just what changed
- Is concise but descriptive
- Includes any relevant issue numbers
```

### /project:git:amend
File: `.claude/commands/git/amend.md`
```markdown
Help me amend the last commit. Show me the current commit message and changes, then:
1. Ask what needs to be amended (message, files, or both)
2. Guide me through staging additional changes if needed
3. Create the amended commit with improved message if requested
4. Verify the amendment was successful
```

## Branch Management Commands

### /project:git:new-branch
File: `.claude/commands/git/new-branch.md`
```markdown
Create a new branch for: $ARGUMENTS

First, check existing branches to avoid duplicates. Suggest an appropriate branch name following our naming convention (feature/, bugfix/, hotfix/, etc.). Create the branch and set up tracking with the remote repository.
```

### /project:git:cleanup-branches
File: `.claude/commands/git/cleanup-branches.md`
```markdown
Analyze all local branches and:
1. List branches already merged into main/master
2. Show branches with no recent activity (>30 days)
3. Identify branches with no remote tracking
4. Suggest safe cleanup commands
5. Check for any uncommitted work before deletion
```

### /project:git:branch-status
File: `.claude/commands/git/branch-status.md`
```markdown
Show comprehensive branch status:
- Current branch and its remote tracking
- Commits ahead/behind remote
- List of all local branches with last commit date
- Any diverged branches that need attention
- Suggested next actions
```

## Merge & Conflict Commands

### /project:git:merge-conflicts
File: `.claude/commands/git/merge-conflicts.md`
```markdown
Help resolve current merge conflicts:
1. Show all conflicted files
2. For each conflict, explain what both sides are trying to do
3. Suggest intelligent resolution preserving functionality
4. Verify no syntax errors after resolution
5. Prepare for completing the merge
```

### /project:git:merge-branch
File: `.claude/commands/git/merge-branch.md`
```markdown
Merge branch $ARGUMENTS into the current branch:
1. Check if branches can be cleanly merged
2. Identify potential conflicts
3. Suggest merge vs rebase based on situation
4. Perform the merge with appropriate strategy
5. Help resolve any conflicts that arise
```

## History & Analysis Commands

### /project:git:recent-commits
File: `.claude/commands/git/recent-commits.md`
```markdown
Show the last 20 commits with:
- Commit hash, author, and date
- Files changed and stats
- Identify any concerning patterns (large commits, direct to main, etc.)
- Group commits by feature/purpose if possible
- Highlight any commits that might need attention
```

### /project:git:file-history
File: `.claude/commands/git/file-history.md`
```markdown
Show detailed history for file: $ARGUMENTS

Display:
- All commits affecting this file
- What changed in each commit
- Who made changes and when
- Any major refactoring or moves
- Current blame information for context
```

### /project:git:find-commit
File: `.claude/commands/git/find-commit.md`
```markdown
Search for commits related to: $ARGUMENTS

Search through:
- Commit messages
- Changed files
- Code changes
Show relevant commits with context and suggest next actions.
```

## Stash Commands

### /project:git:stash-smart
File: `.claude/commands/git/stash-smart.md`
```markdown
Intelligently stash current changes:
1. Show what will be stashed
2. Create descriptive stash message
3. Determine if --keep-index is needed
4. Stash the changes
5. Confirm working directory is clean
```

### /project:git:stash-apply
File: `.claude/commands/git/stash-apply.md`
```markdown
List all stashes with:
- Stash index and message
- Preview of changes in each stash
- Date created
- Branch where stashed
Help me choose and apply the appropriate stash.
```

## Recovery Commands

### /project:git:recover
File: `.claude/commands/git/recover.md`
```markdown
Help recover lost work: $ARGUMENTS

Check:
- Reflog for lost commits
- Stash list for forgotten stashes
- Dangling commits
- Recently deleted branches
Guide recovery of the specified lost work.
```

### /project:git:undo-last
File: `.claude/commands/git/undo-last.md`
```markdown
Safely undo the last git operation:
1. Identify what the last operation was
2. Explain multiple undo options (reset, revert, etc.)
3. Recommend the safest approach
4. Execute the undo
5. Verify the result
```

## Workflow Commands

### /project:git:pr-ready
File: `.claude/commands/git/pr-ready.md`
```markdown
Prepare branch for pull request:
1. Update from main/master
2. Clean up commit history if needed
3. Run tests and linting
4. Check for console.logs or debug code
5. Generate PR description from commits
6. Verify no sensitive data in commits
```

### /project:git:morning-sync
File: `.claude/commands/git/morning-sync.md`
```markdown
Morning git synchronization:
1. Fetch all remotes
2. Show what changed upstream
3. List branches that need updating
4. Show any PRs assigned to me
5. Identify priority work for today
6. Clean up any merged branches
```

### /project:git:eod-save
File: `.claude/commands/git/eod-save.md`
```markdown
End of day git save:
1. Check for uncommitted changes
2. Create WIP commit if needed
3. Push all local branches
4. List tomorrow's priorities
5. Suggest any cleanup needed
6. Create backup branch if requested
```

## Rebase Commands

### /project:git:rebase-interactive
File: `.claude/commands/git/rebase-interactive.md`
```markdown
Guide interactive rebase for the last $ARGUMENTS commits:
1. Show commits that will be affected
2. Suggest which commits to squash/reword
3. Help write better commit messages
4. Handle any conflicts during rebase
5. Verify history looks correct
```

### /project:git:rebase-update
File: `.claude/commands/git/rebase-update.md`
```markdown
Rebase current branch onto main/master:
1. Check if rebase is appropriate
2. Identify potential conflicts
3. Perform the rebase
4. Help resolve conflicts maintaining functionality
5. Force push safely if needed
```

## Advanced Commands

### /project:git:bisect
File: `.claude/commands/git/bisect.md`
```markdown
Use git bisect to find when bug was introduced: $ARGUMENTS

Guide through:
1. Starting bisect
2. Identifying good/bad commits
3. Testing each bisection point
4. Narrowing down to problem commit
5. Analyzing what changed
```

### /project:git:cherry-pick-smart
File: `.claude/commands/git/cherry-pick-smart.md`
```markdown
Cherry-pick commits related to: $ARGUMENTS

1. Search for relevant commits
2. Show what each commit changes
3. Check for dependencies
4. Perform cherry-picks in correct order
5. Resolve any conflicts
```

## Configuration Commands

### /project:git:setup-hooks
File: `.claude/commands/git/setup-hooks.md`
```markdown
Set up git hooks for this project:
1. Check existing hooks
2. Create pre-commit hook for linting/tests
3. Add commit-msg hook for format validation
4. Set up pre-push safety checks
5. Make hooks executable
6. Test hook functionality
```

### /project:git:config-check
File: `.claude/commands/git/config-check.md`
```markdown
Review and optimize git configuration:
1. Check global vs local settings
2. Verify user name/email
3. Suggest useful aliases
4. Configure helpful defaults
5. Set up GPG signing if needed
6. Optimize for repository size/type
```

## Quick Analysis Commands

### /project:git:status
File: `.claude/commands/git/status.md`
```markdown
Provide enhanced git status showing:
- Current branch and tracking info
- Staged vs unstaged changes
- Untracked files that might need attention
- Stash count
- Recent commits
- Suggested next actions
```

### /project:git:blame-context
File: `.claude/commands/git/blame-context.md`
```markdown
Show blame information for file with context: $ARGUMENTS

For each significant section show:
- Who wrote it and when
- The commit message explaining why
- Related changes in that commit
- Historical context if relevant
```

## Usage Tips

1. **Arguments**: Commands with `$ARGUMENTS` accept additional input
   - Example: `/project:git:new-branch user-authentication-feature`

2. **Combining Commands**: Chain multiple commands for complex workflows
   - Start with `/project:git:status`
   - Then use `/project:git:smart-commit`

3. **Safety First**: These commands prioritize safety
   - Always preview destructive operations
   - Create backups when appropriate
   - Explain risks clearly

4. **Project-Specific**: Save in `.claude/commands/git/` for team sharing
   - Or in `~/.claude/commands/git/` for personal use across projects

Remember: These commands are designed to be helpful guardrails, not restrictive rules. Adapt them to your team's workflow.