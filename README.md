# Claude Nine 🚀

**Ready-to-use prompts and slash commands for Claude Code** - Make AI-assisted development faster, smarter, and more reliable.

> Perfect for developers of all levels who want to supercharge their Claude Code experience

## What is this?

This is a collection of **proven prompts and slash commands** that help you work more effectively with Claude Code. Whether you're debugging, deploying, or just exploring your codebase, these tools help you get better results faster.

**No setup complexity. No learning curve. Just copy, paste, and code better.**

## 🎯 Quick Start (2 minutes)

1. **Download**: Clone or download this repository
2. **Choose your style**: Use prompts directly OR set up slash commands (optional)
3. **Start coding**: Pick any prompt that matches your current task

### Option A: Use Prompts Directly (Easiest)
Just copy any prompt from the files and use it in Claude Code:

```bash
# From git_assistant.md
claude "Analyze the current changes using git diff and git status, then create a meaningful commit message following conventional commits format"

# From debug_detective.md  
claude "Analyze this error and help me debug it: TypeError: Cannot read property 'length' of undefined"

# From testing_helper.md
claude "Write comprehensive tests for the getUserById function including happy path, edge cases, and error scenarios"
```

### Option B: Set Up Slash Commands (Recommended)
Create custom slash commands for even faster access:

```bash
# Create command directories
mkdir -p .claude/commands/git
mkdir -p .claude/commands/test
mkdir -p .claude/commands/debug

# Copy any prompt content to a .md file
# Example: Save git smart-commit prompt as .claude/commands/git/smart-commit.md
# Then use: /project:git:smart-commit
```

## 🛠️ What's Included

### Core Development Tools
- **🔧 Git Assistant** - Smart commits, branch management, conflict resolution
- **🧪 Testing Helper** - Write tests, improve coverage, debug failures
- **🐛 Debug Detective** - Systematic debugging, error analysis, root cause finding
- **♻️ Refactor Assistant** - Code improvement, pattern introduction, technical debt reduction
- **🚀 Deployment Guide** - Production deployments, rollbacks, CI/CD workflows
- **💬 Codebase Chat** - Architecture exploration, feature brainstorming, code discovery

### Project Maintenance (Advanced)
- **Implementation Validator** - Verify your code matches your docs
- **Accuracy Synchronizer** - Keep documentation in sync
- **Integration Analyzer** - Map connections between components
- **Critical Path Tracker** - Identify blockers and priorities
- **Blueprint Optimizer** - Clean up messy specifications

## 🎨 Examples

### Git Workflow
```bash
# Smart commit with analysis
claude "Analyze current changes and create a meaningful commit message following conventional commits format"

# Branch cleanup
claude "List all local branches, identify merged ones, and help me clean up stale branches"

# Conflict resolution
claude "Help resolve merge conflicts by understanding the intent of both changes"
```

### Testing
```bash
# Write comprehensive tests
claude "Write unit tests for the PaymentProcessor class including constructor scenarios, method interactions, and error handling"

# Fix failing tests
claude "Debug why this test is failing and suggest fixes"

# Improve coverage
claude "Find untested code paths and write tests for them"
```

### Debugging
```bash
# Error analysis
claude "Analyze this error: 'Cannot read property of undefined' - provide root cause analysis and debugging steps"

# Performance issues
claude "Debug performance issues - profile execution bottlenecks and suggest optimizations"

# Race conditions
claude "Identify and fix race conditions in this async code"
```

### Deployment
```bash
# Pre-deployment check
claude "Run comprehensive pre-deployment checklist including tests, security, and environment validation"

# Production deployment
claude "Guide me through a safe production deployment with monitoring and rollback plan"

# Emergency rollback
claude "Execute emergency rollback - switch traffic to previous version and verify service restoration"
```

## 🏗️ How to Use Each Tool

### For Beginners
1. **Start with Git Assistant** - Learn better commit practices
2. **Try Testing Helper** - Write your first automated tests
3. **Use Codebase Chat** - Understand your project better

### For Intermediate Developers
1. **Add Debug Detective** - Systematic bug fixing
2. **Use Deployment Guide** - Professional deployment practices
3. **Try Refactor Assistant** - Improve code quality

### For Advanced Users
1. **Set up Slash Commands** - Maximum efficiency
2. **Use Project Maintenance tools** - Keep large projects organized
3. **Customize prompts** - Adapt to your specific workflow

## 📂 File Structure

```
├── README.md                    # This file
├── git_assistant.md            # Git workflow commands
├── testing_helper.md           # Testing and coverage commands  
├── debug_detective.md          # Debugging and troubleshooting
├── refactor_assistant.md       # Code improvement commands
├── deployment_guide.md         # Production deployment commands
├── codebase_chat.md           # Exploration and brainstorming
├── implementation_validator.md # Code validation (advanced)
├── accuracy_synchronizer.md   # Documentation sync (advanced)
├── integration_analyzer.md    # Component mapping (advanced)
├── critical_path_tracker.md   # Priority management (advanced)
└── blueprint_optimizer.md     # Spec cleanup (advanced)
```

## ⚡ Pro Tips

### Get Better Results
- **Be specific**: Instead of "fix this bug", try "debug this TypeError in the user authentication flow"
- **Provide context**: Share error messages, code snippets, or file names
- **Chain commands**: Combine multiple prompts for complex workflows

### Save Time
- **Use slash commands** for frequently used prompts
- **Customize prompts** to match your team's conventions
- **Keep this README handy** as a quick reference

### Level Up
- **Start simple** with basic prompts, then try advanced features
- **Share with your team** - these work great for collaborative development
- **Adapt and modify** prompts to fit your specific needs

## 🤝 Contributing

Found a better way to phrase a prompt? Have ideas for new commands? 

- Open an issue with suggestions
- Submit a pull request with improvements
- Share your custom prompts with the community

## 📝 License

MIT License - Use these prompts however you like, in any project, commercial or personal.

---

**Ready to code smarter?** Pick any prompt from the files above and start using Claude Code more effectively today! 

*No configuration required. No complex setup. Just better AI-assisted development.*