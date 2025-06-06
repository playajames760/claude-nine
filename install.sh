#!/bin/bash

# Claude Nine - Interactive Installation Script
# Simple, intuitive installer with interactive menus

set -e

# Configuration
REPO_URL="https://github.com/playajames760/claude-nine.git"
INSTALL_DIR="$HOME/.claude/commands/claude-nine"
VERSION_FILE="$HOME/.claude/claude-nine.version"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m'

# Logging functions
log_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }
log_success() { echo -e "${GREEN}✅ $1${NC}"; }
log_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
log_error() { echo -e "${RED}❌ $1${NC}"; }
log_step() { echo -e "${PURPLE}🔧 $1${NC}"; }

# Utility functions
command_exists() { command -v "$1" >/dev/null 2>&1; }
press_enter() { echo -e "\n${CYAN}Press Enter to continue...${NC}"; read -r; }

# Check prerequisites
check_prerequisites() {
    local missing=()
    
    if ! command_exists git; then missing+=("git"); fi
    if ! command_exists claude; then log_warning "Claude Code CLI not detected"; fi
    
    if [[ ${#missing[@]} -gt 0 ]]; then
        log_error "Missing required tools: ${missing[*]}"
        echo "Please install them first and try again."
        exit 1
    fi
    
    log_success "All prerequisites met"
}

# Show banner
show_banner() {
    clear
    echo -e "${BOLD}${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                      🤖 Claude Nine                         ║"
    echo "║              Advanced AI Development Assistant               ║"
    echo "║                                                              ║"
    echo "║  Transform your development workflow with 50+ AI commands    ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo
}

# Show main menu
show_main_menu() {
    local status="$(get_installation_status)"
    
    echo -e "${BOLD}What would you like to do?${NC}"
    echo
    echo -e "  ${GREEN}1)${NC} Install Claude Nine commands"
    if [[ "$status" == "installed" ]]; then
        echo -e "  ${BLUE}2)${NC} Update to latest version"
        echo -e "  ${RED}3)${NC} Uninstall Claude Nine"
        echo -e "  ${CYAN}4)${NC} Show installation status"
    fi
    echo -e "  ${YELLOW}0)${NC} Exit"
    echo
    echo -n "Enter your choice: "
}

# Get installation status
get_installation_status() {
    if [[ -d "$INSTALL_DIR" && -f "$VERSION_FILE" ]]; then
        echo "installed"
    else
        echo "not-installed"
    fi
}

# Show installation options
show_install_options() {
    echo -e "${BOLD}Choose installation type:${NC}"
    echo
    echo -e "  ${GREEN}1)${NC} Quick Install (Essential commands only)"
    echo -e "  ${BLUE}2)${NC} Full Install (All 50+ commands)"
    echo -e "  ${PURPLE}3)${NC} Custom Install (Choose categories)"
    echo -e "  ${YELLOW}0)${NC} Back to main menu"
    echo
    echo -n "Enter your choice: "
}

# Show command categories for custom install
show_categories() {
    echo -e "${BOLD}Select command categories to install:${NC}"
    echo
    echo -e "  ${GREEN}1)${NC} Git Assistant (Smart commits, branch management)"
    echo -e "  ${GREEN}2)${NC} Testing Helper (Test generation, coverage analysis)"
    echo -e "  ${GREEN}3)${NC} Debug Detective (Error analysis, performance debugging)"
    echo -e "  ${GREEN}4)${NC} Refactor Assistant (Code improvement, modernization)"
    echo -e "  ${GREEN}5)${NC} Security Auditor (Vulnerability scanning, security fixes)"
    echo -e "  ${GREEN}6)${NC} React Assistant (Component generation, optimization)"
    echo -e "  ${GREEN}7)${NC} Code Health Monitor (Quality metrics, technical debt)"
    echo -e "  ${GREEN}8)${NC} Deployment Guide (CI/CD, containerization)"
    echo -e "  ${GREEN}9)${NC} Advanced Tools (Integration analysis, blueprint optimization)"
    echo -e "  ${BLUE}A)${NC} Select All"
    echo -e "  ${YELLOW}0)${NC} Back"
    echo
    echo "Enter categories (comma-separated, e.g., 1,2,3): "
}

# Install essential commands
install_essential() {
    log_step "Installing essential commands..."
    
    local commands=(
        "git_assistant.md:git"
        "testing_helper.md:test"
        "debug_detective.md:debug"
        "codebase_chat.md:chat"
    )
    
    for cmd in "${commands[@]}"; do
        local file="${cmd%:*}"
        local category="${cmd#*:}"
        install_command_category "$file" "$category"
    done
    
    log_success "Essential commands installed"
}

# Install all commands
install_full() {
    log_step "Installing all commands..."
    
    local commands=(
        "git_assistant.md:git"
        "testing_helper.md:test"
        "debug_detective.md:debug"
        "refactor_assistant.md:refactor"
        "deployment_guide.md:deploy"
        "codebase_chat.md:chat"
        "implementation_validator.md:validate"
        "accuracy_synchronizer.md:sync"
        "integration_analyzer.md:analyze"
        "critical_path_tracker.md:track"
        "blueprint_optimizer.md:optimize"
        "code_health_monitor.md:health"
        "technical_debt_hunter.md:debt"
        "react_assistant.md:react"
        "security_auditor.md:security"
        "dependency_optimizer.md:deps"
        "legacy_modernizer.md:legacy"
    )
    
    for cmd in "${commands[@]}"; do
        local file="${cmd%:*}"
        local category="${cmd#*:}"
        install_command_category "$file" "$category"
    done
    
    log_success "All commands installed"
}

# Install custom selection
install_custom() {
    local selection="$1"
    log_step "Installing selected categories..."
    
    declare -A category_map=(
        ["1"]="git_assistant.md:git"
        ["2"]="testing_helper.md:test"
        ["3"]="debug_detective.md:debug"
        ["4"]="refactor_assistant.md:refactor"
        ["5"]="security_auditor.md:security"
        ["6"]="react_assistant.md:react"
        ["7"]="code_health_monitor.md:health"
        ["8"]="deployment_guide.md:deploy"
        ["9"]="integration_analyzer.md:analyze,critical_path_tracker.md:track,blueprint_optimizer.md:optimize"
    )
    
    IFS=',' read -ra selected <<< "$selection"
    for item in "${selected[@]}"; do
        item=$(echo "$item" | tr -d ' ')
        if [[ -n "${category_map[$item]}" ]]; then
            local commands="${category_map[$item]}"
            IFS=',' read -ra cmd_list <<< "$commands"
            for cmd in "${cmd_list[@]}"; do
                local file="${cmd%:*}"
                local category="${cmd#*:}"
                install_command_category "$file" "$category"
            done
        fi
    done
    
    log_success "Selected categories installed"
}

# Install a specific command category
install_command_category() {
    local file="$1"
    local category="$2"
    local source_file=""
    
    # Find the source file
    for subdir in "" "commands/essential" "commands/quality" "commands/workflow" "commands/advanced" "commands/core"; do
        local check_path="$INSTALL_DIR/$subdir/$file"
        if [[ -f "$check_path" ]]; then
            source_file="$check_path"
            break
        fi
    done
    
    # Also check root directory for standalone files
    if [[ -z "$source_file" && -f "$INSTALL_DIR/$file" ]]; then
        source_file="$INSTALL_DIR/$file"
    fi
    
    if [[ -n "$source_file" ]]; then
        local target_dir="$HOME/.claude/commands/$category"
        mkdir -p "$target_dir"
        
        # Create command file
        local target_file="$target_dir/$(basename "$file")"
        cp "$source_file" "$target_file"
        
        echo -e "  ${GREEN}✓${NC} $category commands"
    else
        echo -e "  ${RED}✗${NC} $file not found"
    fi
}

# Clone or update repository
setup_repository() {
    log_step "Setting up Claude Nine repository..."
    
    mkdir -p "$(dirname "$INSTALL_DIR")"
    
    if [[ -d "$INSTALL_DIR" ]]; then
        log_info "Updating existing installation..."
        cd "$INSTALL_DIR"
        git pull origin main
        cd - >/dev/null
    else
        log_info "Cloning repository..."
        git clone "$REPO_URL" "$INSTALL_DIR"
    fi
    
    log_success "Repository ready"
}

# Main installation process
do_install() {
    local install_type="$1"
    local selection="$2"
    
    echo
    log_step "Starting installation..."
    
    check_prerequisites
    setup_repository
    
    case "$install_type" in
        "essential") install_essential ;;
        "full") install_full ;;
        "custom") install_custom "$selection" ;;
    esac
    
    # Save version info
    cd "$INSTALL_DIR"
    git rev-parse HEAD > "$VERSION_FILE"
    date >> "$VERSION_FILE"
    cd - >/dev/null
    
    setup_mcp_servers
    show_success_message
}

# Setup MCP servers
setup_mcp_servers() {
    if ! command_exists npm; then
        log_warning "npm not available - skipping MCP setup"
        return 0
    fi
    
    echo
    log_step "Setting up MCP servers..."
    
    cat > ".mcp.json" << 'EOF'
{
  "mcpServers": {
    "filesystem": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-filesystem", "."]
    },
    "git": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-git", "--repository", "."]
    }
  }
}
EOF
    
    log_success "MCP servers configured"
}

# Show success message
show_success_message() {
    echo
    echo -e "${GREEN}${BOLD}🎉 Installation Complete!${NC}"
    echo
    echo -e "${BOLD}Your new slash commands:${NC}"
    
    local base_dir="$HOME/.claude/commands"
    for dir in "$base_dir"/*; do
        if [[ -d "$dir" ]]; then
            local category=$(basename "$dir")
            echo -e "  ${GREEN}/$category${NC} - $(get_category_description "$category")"
        fi
    done
    
    echo
    echo -e "${BOLD}Quick examples:${NC}"
    echo -e "  ${CYAN}claude /$category:smart-commit${NC}    # Intelligent git commits"
    echo -e "  ${CYAN}claude /$category:generate-tests${NC}  # Auto-generate tests"
    echo -e "  ${CYAN}claude /$category:debug-analysis${NC}  # Analyze errors"
    echo
    echo -e "${YELLOW}💡 Tip: Use 'claude --help' to see all available commands${NC}"
    
    press_enter
}

# Get category description
get_category_description() {
    case "$1" in
        "git") echo "Smart git operations" ;;
        "test") echo "Testing and QA tools" ;;
        "debug") echo "Error analysis and debugging" ;;
        "refactor") echo "Code improvement tools" ;;
        "security") echo "Security scanning and fixes" ;;
        "react") echo "React development assistant" ;;
        "health") echo "Code quality monitoring" ;;
        "deploy") echo "Deployment and CI/CD" ;;
        *) echo "Development tools" ;;
    esac
}

# Update installation
do_update() {
    echo
    log_step "Updating Claude Nine..."
    
    if [[ ! -d "$INSTALL_DIR" ]]; then
        log_error "Claude Nine is not installed"
        return 1
    fi
    
    cd "$INSTALL_DIR"
    local old_version=$(git rev-parse HEAD)
    git pull origin main
    local new_version=$(git rev-parse HEAD)
    cd - >/dev/null
    
    if [[ "$old_version" == "$new_version" ]]; then
        log_info "Already up to date"
    else
        echo "$new_version" > "$VERSION_FILE"
        date >> "$VERSION_FILE"
        log_success "Updated to latest version"
    fi
    
    press_enter
}

# Uninstall
do_uninstall() {
    echo
    echo -e "${RED}${BOLD}⚠️  Uninstall Claude Nine${NC}"
    echo
    echo "This will remove:"
    echo "• All slash commands"
    echo "• Installation directory"
    echo "• Configuration files"
    echo
    echo -n "Are you sure? (yes/no): "
    read -r confirm
    
    if [[ "$confirm" == "yes" ]]; then
        log_step "Removing Claude Nine..."
        
        rm -rf "$INSTALL_DIR"
        rm -f "$VERSION_FILE"
        rm -rf "$HOME/.claude/commands"
        rm -f ".mcp.json"
        
        log_success "Claude Nine has been uninstalled"
    else
        log_info "Uninstall cancelled"
    fi
    
    press_enter
}

# Show status
show_status() {
    echo
    echo -e "${BOLD}Installation Status${NC}"
    echo
    
    if [[ -d "$INSTALL_DIR" ]]; then
        echo -e "${GREEN}✓${NC} Claude Nine is installed"
        
        if [[ -f "$VERSION_FILE" ]]; then
            local version=$(head -n1 "$VERSION_FILE")
            local install_date=$(tail -n1 "$VERSION_FILE")
            echo -e "  Version: ${CYAN}${version:0:8}${NC}"
            echo -e "  Installed: ${CYAN}$install_date${NC}"
        fi
        
        local command_count=$(find "$HOME/.claude/commands" -name "*.md" 2>/dev/null | wc -l)
        echo -e "  Commands: ${CYAN}$command_count${NC}"
        
        echo
        echo -e "${BOLD}Available categories:${NC}"
        for dir in "$HOME/.claude/commands"/*; do
            if [[ -d "$dir" ]]; then
                local category=$(basename "$dir")
                local count=$(find "$dir" -name "*.md" | wc -l)
                echo -e "  ${GREEN}$category${NC} ($count commands)"
            fi
        done
    else
        echo -e "${RED}✗${NC} Claude Nine is not installed"
    fi
    
    press_enter
}

# Main program loop
main() {
    while true; do
        show_banner
        show_main_menu
        
        read -r choice
        
        case "$choice" in
            1)
                show_install_options
                read -r install_choice
                
                case "$install_choice" in
                    1) do_install "essential" ;;
                    2) do_install "full" ;;
                    3)
                        show_categories
                        read -r selection
                        if [[ "$selection" == "A" || "$selection" == "a" ]]; then
                            do_install "full"
                        elif [[ "$selection" != "0" ]]; then
                            do_install "custom" "$selection"
                        fi
                        ;;
                    0) continue ;;
                esac
                ;;
            2)
                if [[ "$(get_installation_status)" == "installed" ]]; then
                    do_update
                fi
                ;;
            3)
                if [[ "$(get_installation_status)" == "installed" ]]; then
                    do_uninstall
                fi
                ;;
            4)
                if [[ "$(get_installation_status)" == "installed" ]]; then
                    show_status
                fi
                ;;
            0)
                echo -e "\n${GREEN}Thanks for using Claude Nine! 🤖${NC}"
                exit 0
                ;;
            *)
                echo -e "\n${RED}Invalid choice. Please try again.${NC}"
                sleep 1
                ;;
        esac
    done
}

# Handle command line arguments
case "${1:-}" in
    "--install"|"install") 
        check_prerequisites
        do_install "full"
        ;;
    "--update"|"update")
        do_update
        ;;
    "--uninstall"|"uninstall")
        do_uninstall
        ;;
    "--status"|"status")
        show_status
        ;;
    "--help"|"help")
        echo "Claude Nine Interactive Installer"
        echo
        echo "Usage: $0 [option]"
        echo
        echo "Options:"
        echo "  (no args)     Interactive mode"
        echo "  --install     Quick full install"
        echo "  --update      Update to latest"
        echo "  --uninstall   Remove installation"
        echo "  --status      Show status"
        echo "  --help        Show this help"
        ;;
    "")
        main
        ;;
    *)
        echo "Unknown option: $1"
        echo "Use '$0 --help' for usage"
        exit 1
        ;;
esac