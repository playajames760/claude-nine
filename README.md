# Claude Nine 🚀

**Ready-to-use prompts and slash commands for Claude Code** - Make AI-assisted development faster, smarter, and more reliable.

> Perfect for developers of all levels who want to supercharge their Claude Code experience

## What is this?

This is a collection of **proven prompts and slash commands** that help you work more effectively with Claude Code. Whether you're debugging, deploying, or just exploring your codebase, these tools help you get better results faster.

**No setup complexity. No learning curve. Just copy, paste, and code better.**

## 🚀 Installation (30 seconds)

### Automatic Installation (Recommended)
Run our smart installer that handles everything:

```bash
# Navigate to your project directory
cd your-project

# Download and run the installer
curl -sSL https://raw.githubusercontent.com/playajames760/claude-nine/main/install.sh | bash

# Or clone and install manually
git clone https://github.com/playajames760/claude-nine.git
cd claude-nine
./install.sh
```

**What the installer does:**
- ✅ Creates `.claude/commands/claude-nine/` structure
- ✅ Sets up all slash commands automatically
- ✅ Configures git integration for updates
- ✅ Backs up existing commands (if any)
- ✅ Provides easy update mechanism

### Manual Installation (If you prefer control)
```bash
# In any project directory
mkdir -p .claude/commands
git clone https://github.com/playajames760/claude-nine.git .claude/commands/claude-nine

# Use commands like: /project:claude-nine:git:smart-commit
```

### Using the Commands

After installation, use slash commands in Claude Code:

```bash
# Git workflow commands
claude /project:git:smart-commit          # Analyze changes and create smart commits
claude /project:git:branch-cleanup        # Clean up merged branches
claude /project:git:conflict-resolver     # Help with merge conflicts

# Testing commands  
claude /project:test:write-comprehensive  # Write complete test suites
claude /project:test:debug-failures       # Debug failing tests
claude /project:test:improve-coverage     # Find and test uncovered code

# Debugging commands
claude /project:debug:analyze-error       # Systematic error analysis
claude /project:debug:performance-audit   # Find performance bottlenecks
claude /project:debug:race-conditions     # Identify async issues

# And many more...
```

### Management Commands

```bash
# Update to latest version
./install.sh --update

# Check installation status
./install.sh --status

# Edit configuration
./install.sh --config

# Get help
./install.sh --help
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
- **Blueprint Optimizer** - Clean up messy CLAUDE.md files

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
└── blueprint_optimizer.md     # CLAUDE.md cleanup (advanced)
```

## ⚡ Pro Tips

### Installation & Updates
- **Auto-updates**: Set `AUTO_UPDATE=true` in config for seamless updates
- **Custom configurations**: Edit `.claude/claude-nine.config` to customize installation
- **Backup safety**: All updates automatically backup your existing setup
- **Selective installation**: Choose which command categories to install

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

### Maintenance
```bash
# Check what's installed and available
./install.sh --status

# Update to latest features and improvements
./install.sh --update

# Configure which command categories to use
./install.sh --config
```

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