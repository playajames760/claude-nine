# Claude Nine 🚀

Transform Claude Code into a powerful coding assistant with 50+ specialized commands for debugging, testing, git workflows, and more.

## What is this?

Claude Nine provides ready-to-use commands that turn Claude into an expert coding partner. Get instant help with common development tasks - from writing tests to deploying projects.

## 🚀 Quick Start

### Installation
```bash
# Navigate to your project
cd your-project

# Install with interactive menu
curl -sSL https://raw.githubusercontent.com/playajames760/claude-nine/main/install.sh | bash
```

Choose from:
- **Quick Install** - Essential commands only
- **Full Install** - All 50+ commands  
- **Custom Install** - Pick specific categories

### First Steps

1. **Backup your work with git** (essential safety step)
2. **Start Claude Code**: `claude`
3. **Create project memory**: `touch CLAUDE.md` and add project commands/notes
4. **Try your first command**: Ask Claude to help with any coding task

## Essential Commands

**Core Tools** (Start here - handles 90% of daily tasks):
- `/git-assistant` - Smart commits and git workflows
- `/testing-helper` - Write and debug tests  
- `/debug-detective` - Fix bugs and errors
- `/codebase-chat` - Understand large projects

**Quality Tools**:
- `/refactor-assistant` - Clean up code
- `/security-auditor` - Find security issues
- `/code-health-monitor` - Track code quality

**Workflow Tools**:
- `/deployment-guide` - Deploy projects
- `/react-assistant` - React development help

> 💡 **Tip:** Just ask naturally! Say "help me write tests" instead of memorizing commands.

<details>
<summary>View All 50+ Commands</summary>

**Advanced Tools**:
- `/implementation-validator` - Verify code matches requirements
- `/accuracy-synchronizer` - Keep docs and code in sync  
- `/integration-analyzer` - Analyze system connections
- `/critical-path-tracker` - Identify project priorities
- `/blueprint-optimizer` - Optimize documentation
- `/dependency-optimizer` - Manage packages
- `/legacy-modernizer` - Modernize old code
- `/technical-debt-hunter` - Find code problems

**Specialized Commands**: Each category includes multiple sub-commands (e.g., `/git:smart-commit`, `/test:coverage-analysis`, `/debug:performance-audit`)

</details>

## Usage Examples

```bash
# Natural language - Claude picks the right tools automatically
"Help me write tests for my login function"
"This error is confusing, can you debug it?"  
"Create a commit message for my changes"
"How do I deploy this React app?"
```

## Management

```bash
./install.sh --update      # Get latest features
./install.sh --status      # Check installation  
./install.sh --uninstall   # Clean removal
```

## Best Practices

### Project Setup
- **Create CLAUDE.md** with project commands and notes
- **Backup with git** before major changes
- **Use specific requests**: "Fix TypeError in login function" vs "fix my bug"

### Effective Usage
- **Natural language works best** - describe what you want
- **Chain requests** - "write tests, run them, then fix failures"  
- **Share error messages** and problematic code
- **Use /clear** to reset context during long sessions

## Project Structure

```
📦 claude-nine/
├── 📖 README.md                    # This guide
├── 🔧 install.sh                  # Interactive installer
└── 📂 commands/
    ├── 🌟 essential/              # Core tools (start here)
    │   ├── 🔧 git_assistant.md    # Git workflows
    │   ├── 🧪 testing_helper.md   # Testing support
    │   ├── 🐛 debug_detective.md  # Debugging help
    │   └── 💬 codebase_chat.md    # Code understanding
    ├── 💎 quality/                # Code improvement
    ├── 🚀 workflow/               # Development flow
    └── 🎓 advanced/               # Power user features
```

## Getting Started

### First Conversation
```
Hi Claude! I just installed Claude Nine. 
I'm [experience level] working on [project description].
Can you help me get started?
```

### Learning Path
1. **Week 1**: Master core tools (git, testing, debugging, codebase chat)
2. **Month 1**: Add quality tools (refactoring, security, deployment)  
3. **Beyond**: Explore advanced features for complex projects

## Contributing

Found a bug or have suggestions? We'd love your help!

- 🐛 **Report issues** on GitHub
- 💡 **Suggest features** with use cases
- ✨ **Submit improvements** via pull requests
- ⭐ **Star the project** if it helped you


## License

MIT License - Use for personal, educational, and commercial projects.

---

**Ready to start?** Run `./install.sh` and begin your coding adventure! 🚀
