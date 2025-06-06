#!/bin/bash

# Claude Nine - Advanced Installation Script
# Installs Claude Nine slash commands with git integration and update capabilities

set -e  # Exit on any error

# Configuration
REPO_URL="https://github.com/playajames760/claude-nine.git"  # Update this with actual repo URL
INSTALL_DIR=".claude/commands/claude-nine"
CONFIG_FILE=".claude/claude-nine.config"
VERSION_FILE=".claude/claude-nine.version"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check prerequisites
check_prerequisites() {
    log_info "Checking prerequisites..."
    
    if ! command_exists git; then
        log_error "Git is required but not installed. Please install git first."
        exit 1
    fi
    
    if ! command_exists claude; then
        log_warning "Claude Code CLI not detected. Make sure it's installed and in PATH."
    fi
    
    log_success "Prerequisites check completed"
}

# Create default configuration
create_default_config() {
    cat > "$CONFIG_FILE" << EOF
# Claude Nine Configuration
# Edit this file to customize your installation

# Installation settings
AUTO_UPDATE=true
BACKUP_ON_UPDATE=true
PRESERVE_CUSTOM_COMMANDS=true

# Command categories to install (set to false to skip)
INSTALL_GIT_ASSISTANT=true
INSTALL_TESTING_HELPER=true
INSTALL_DEBUG_DETECTIVE=true
INSTALL_REFACTOR_ASSISTANT=true
INSTALL_DEPLOYMENT_GUIDE=true
INSTALL_CODEBASE_CHAT=true
INSTALL_IMPLEMENTATION_VALIDATOR=true
INSTALL_ACCURACY_SYNCHRONIZER=true
INSTALL_INTEGRATION_ANALYZER=true
INSTALL_CRITICAL_PATH_TRACKER=true
INSTALL_BLUEPRINT_OPTIMIZER=true

# Custom command prefix (empty for default structure)
COMMAND_PREFIX=""

# Branch to track (main, develop, etc.)
TRACK_BRANCH="main"
EOF
}

# Load configuration
load_config() {
    if [[ -f "$CONFIG_FILE" ]]; then
        source "$CONFIG_FILE"
        log_info "Loaded configuration from $CONFIG_FILE"
    else
        log_info "Creating default configuration..."
        create_default_config
        source "$CONFIG_FILE"
        log_success "Created default configuration at $CONFIG_FILE"
    fi
}

# Get current version
get_current_version() {
    if [[ -f "$VERSION_FILE" ]]; then
        cat "$VERSION_FILE"
    else
        echo "not-installed"
    fi
}

# Get remote version
get_remote_version() {
    if [[ -d "$INSTALL_DIR" ]]; then
        cd "$INSTALL_DIR"
        git fetch origin "$TRACK_BRANCH" 2>/dev/null || true
        git rev-parse "origin/$TRACK_BRANCH" 2>/dev/null || echo "unknown"
        cd - >/dev/null
    else
        echo "not-cloned"
    fi
}

# Save version info
save_version() {
    local version="$1"
    echo "$version" > "$VERSION_FILE"
    echo "$(date)" >> "$VERSION_FILE"
}

# Backup existing installation
backup_installation() {
    if [[ -d "$INSTALL_DIR" && "$BACKUP_ON_UPDATE" == "true" ]]; then
        local backup_dir="${INSTALL_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
        log_info "Creating backup at $backup_dir"
        cp -r "$INSTALL_DIR" "$backup_dir"
        log_success "Backup created successfully"
    fi
}

# Install or clone repository
install_repo() {
    if [[ -d "$INSTALL_DIR" ]]; then
        log_info "Updating existing installation..."
        cd "$INSTALL_DIR"
        
        # Stash any local changes if preserving custom commands
        if [[ "$PRESERVE_CUSTOM_COMMANDS" == "true" ]]; then
            git stash push -m "Auto-stash before update $(date)" 2>/dev/null || true
        fi
        
        git fetch origin "$TRACK_BRANCH"
        git reset --hard "origin/$TRACK_BRANCH"
        
        # Restore custom commands if they were stashed
        if [[ "$PRESERVE_CUSTOM_COMMANDS" == "true" ]]; then
            git stash pop 2>/dev/null || log_info "No custom changes to restore"
        fi
        
        cd - >/dev/null
        log_success "Updated to latest version"
    else
        log_info "Installing Claude Nine for the first time..."
        mkdir -p "$(dirname "$INSTALL_DIR")"
        git clone "$REPO_URL" "$INSTALL_DIR"
        cd "$INSTALL_DIR"
        git checkout "$TRACK_BRANCH"
        cd - >/dev/null
        log_success "Initial installation completed"
    fi
}

# Create command structure
create_command_structure() {
    log_info "Setting up command structure..."
    
    local base_dir=".claude/commands"
    mkdir -p "$base_dir"
    
    # Map of files to command categories
    declare -A command_map=(
        ["git_assistant.md"]="git"
        ["testing_helper.md"]="test"
        ["debug_detective.md"]="debug"
        ["refactor_assistant.md"]="refactor"
        ["deployment_guide.md"]="deploy"
        ["codebase_chat.md"]="chat"
        ["implementation_validator.md"]="validate"
        ["accuracy_synchronizer.md"]="sync"
        ["integration_analyzer.md"]="analyze"
        ["critical_path_tracker.md"]="track"
        ["blueprint_optimizer.md"]="optimize"
    )
    
    # Create category directories and copy files
    for file in "${!command_map[@]}"; do
        local category="${command_map[$file]}"
        local var_name="INSTALL_$(echo "${file%%.md}" | tr '[:lower:]' '[:upper:]' | tr '-' '_')"
        
        # Check if this category should be installed
        if [[ "${!var_name}" == "true" ]]; then
            local target_dir="$base_dir/${COMMAND_PREFIX}${category}"
            mkdir -p "$target_dir"
            
            if [[ -f "$INSTALL_DIR/$file" ]]; then
                # Create individual command files from the main file
                create_individual_commands "$INSTALL_DIR/$file" "$target_dir"
                log_success "Set up $category commands"
            else
                log_warning "Source file $file not found"
            fi
        fi
    done
}

# Extract individual commands from markdown files
create_individual_commands() {
    local source_file="$1"
    local target_dir="$2"
    
    # Read the source file and extract prompts
    # This is a simplified version - you might want to enhance this based on your markdown structure
    local current_command=""
    local current_content=""
    local in_code_block=false
    
    while IFS= read -r line; do
        if [[ "$line" =~ ^##[[:space:]](.+)$ ]]; then
            # Save previous command if exists
            if [[ -n "$current_command" && -n "$current_content" ]]; then
                local filename=$(echo "$current_command" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
                echo "$current_content" > "$target_dir/$filename.md"
            fi
            
            # Start new command
            current_command="${BASH_REMATCH[1]}"
            current_content="$line"$'\n'
        elif [[ -n "$current_command" ]]; then
            current_content+="$line"$'\n'
        fi
    done < "$source_file"
    
    # Save the last command
    if [[ -n "$current_command" && -n "$current_content" ]]; then
        local filename=$(echo "$current_command" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-\|-$//g')
        echo "$current_content" > "$target_dir/$filename.md"
    fi
}

# Show usage examples
show_usage_examples() {
    log_success "Installation completed! Here's how to use your new slash commands:"
    echo
    echo -e "${BLUE}Available command categories:${NC}"
    
    local base_dir=".claude/commands"
    for dir in "$base_dir"/*; do
        if [[ -d "$dir" ]]; then
            local category=$(basename "$dir")
            echo -e "  ${GREEN}/$category${NC}"
            
            # Show a few example commands
            local count=0
            for cmd in "$dir"/*.md; do
                if [[ -f "$cmd" && $count -lt 3 ]]; then
                    local cmdname=$(basename "$cmd" .md)
                    echo -e "    ${YELLOW}/project:$category:$cmdname${NC}"
                    ((count++))
                fi
            done
            
            if [[ $count -eq 3 ]]; then
                echo -e "    ${YELLOW}... and more${NC}"
            fi
            echo
        fi
    done
    
    echo -e "${BLUE}Examples:${NC}"
    echo -e "  ${GREEN}claude /project:git:smart-commit${NC}     # Smart git commits"
    echo -e "  ${GREEN}claude /project:test:write-tests${NC}     # Generate comprehensive tests"
    echo -e "  ${GREEN}claude /project:debug:analyze-error${NC}  # Debug analysis"
    echo
    echo -e "${BLUE}Management commands:${NC}"
    echo -e "  ${GREEN}./install.sh --update${NC}               # Update to latest version"
    echo -e "  ${GREEN}./install.sh --config${NC}               # Edit configuration"
    echo -e "  ${GREEN}./install.sh --status${NC}               # Show installation status"
}

# Show status
show_status() {
    log_info "Claude Nine Installation Status"
    echo
    
    local current_version=$(get_current_version)
    local remote_version=$(get_remote_version)
    
    echo -e "${BLUE}Current Version:${NC} $current_version"
    echo -e "${BLUE}Remote Version:${NC} $remote_version"
    echo -e "${BLUE}Installation Directory:${NC} $INSTALL_DIR"
    echo -e "${BLUE}Configuration File:${NC} $CONFIG_FILE"
    echo
    
    if [[ -d "$INSTALL_DIR" ]]; then
        echo -e "${GREEN}✓${NC} Installation directory exists"
    else
        echo -e "${RED}✗${NC} Installation directory missing"
    fi
    
    if [[ -f "$CONFIG_FILE" ]]; then
        echo -e "${GREEN}✓${NC} Configuration file exists"
    else
        echo -e "${RED}✗${NC} Configuration file missing"
    fi
    
    local command_count=$(find .claude/commands -name "*.md" 2>/dev/null | wc -l)
    echo -e "${BLUE}Available Commands:${NC} $command_count"
}

# Main installation function
main_install() {
    log_info "Starting Claude Nine installation..."
    
    check_prerequisites
    load_config
    
    local current_version=$(get_current_version)
    local remote_version=$(get_remote_version)
    
    if [[ "$current_version" != "not-installed" && "$current_version" == "$remote_version" ]]; then
        log_info "Already up to date (version: $current_version)"
        return 0
    fi
    
    backup_installation
    install_repo
    create_command_structure
    
    # Save version info
    cd "$INSTALL_DIR"
    local new_version=$(git rev-parse HEAD)
    cd - >/dev/null
    save_version "$new_version"
    
    show_usage_examples
    
    log_success "Claude Nine installation completed successfully!"
}


# Command line argument handling
case "${1:-install}" in
    "install" | "")
        main_install
        ;;
    "--update" | "update")
        log_info "Forcing update..."
        main_install
        ;;
    "--config" | "config")
        if command_exists nano; then
            nano "$CONFIG_FILE"
        elif command_exists vim; then
            vim "$CONFIG_FILE"
        else
            log_info "Edit configuration file: $CONFIG_FILE"
        fi
        ;;
    "--status" | "status")
        show_status
        ;;
    "--help" | "help")
        echo "Claude Nine Installation Script"
        echo
        echo "Usage: $0 [command]"
        echo
        echo "Commands:"
        echo "  install, (default)  Install or update Claude Nine"
        echo "  update, --update    Force update to latest version"
        echo "  config, --config    Edit configuration file"
        echo "  status, --status    Show installation status"
        echo "  help, --help        Show this help message"
        ;;
    *)
        log_error "Unknown command: $1"
        echo "Use '$0 --help' for usage information"
        exit 1
        ;;
esac