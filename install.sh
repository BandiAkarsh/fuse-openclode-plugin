#!/usr/bin/env bash

#############################################################################
# FUSE Plugin Installer for OpenCode
# One-command installation of spec-driven workflow orchestration
#
# Inspired by OpenAgentsControl (darrenhinde/OpenAgentsControl)
#############################################################################

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Config
REPO_URL="https://github.com/BandiAkarsh/fuse-openclode-plugin"
BRANCH="main"
RAW_URL="${RAW_URL:-https://raw.githubusercontent.com/BandiAkarsh/fuse-openclode-plugin/${BRANCH}}"
INSTALL_DIR="${OPENCODE_INSTALL_DIR:-$HOME/.config/opencode}"
PLUGIN_DIR="${INSTALL_DIR}/plugin"
FUSE_DIR="${INSTALL_DIR}/fuse-memory"
AGENT_DIR="${INSTALL_DIR}/agent"
CONTEXT_DIR="${INSTALL_DIR}/context"

#############################################################################
# Functions
#############################################################################

print_header() {
    echo -e "${CYAN}${BOLD}"
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                                                                ║"
    echo "║              FUSE Plugin Installer v1.0.0                     ║"
    echo "║         Spec-Driven AI Orchestration for OpenCode            ║"
    echo "║                                                                ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${CYAN}Inspired by OpenAgentsControl (darrenhinde/OpenAgentsControl)${NC}"
    echo ""
}

print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_info() { echo -e "${BLUE}ℹ${NC} $1"; }
print_warning() { echo -e "${YELLOW}⚠${NC} $1"; }

check_dependencies() {
    print_info "Checking dependencies..."
    
    if ! command -v curl &> /dev/null; then
        print_error "curl is required but not installed"
        exit 1
    fi
    
    print_success "Dependencies OK"
}

check_opencode() {
    print_info "Checking for OpenCode..."
    
    if command -v opencode &> /dev/null; then
        print_success "OpenCode found: $(which opencode)"
    else
        print_warning "OpenCode not found in PATH"
        print_info "FUSE will work when OpenCode is installed"
        print_info "Get OpenCode at: https://opencode.ai/docs"
    fi
}

create_directories() {
    print_info "Creating directories..."
    
    mkdir -p "$PLUGIN_DIR"
    mkdir -p "$FUSE_DIR/memory/corrections"
    mkdir -p "$FUSE_DIR/memory/patterns"
    mkdir -p "$FUSE_DIR/memory/self_improvement"
    mkdir -p "$AGENT_DIR/core"
    mkdir -p "$AGENT_DIR/subagents/core"
    mkdir -p "$CONTEXT_DIR/core"
    mkdir -p "$CONTEXT_DIR/project"
    
    print_success "Directories created"
}

download_plugin() {
    print_info "Downloading FUSE plugin..."
    
    # Download main plugin JS
    if curl -fsSL "${RAW_URL}/dist/index.js" -o "${PLUGIN_DIR}/fuse.js"; then
        print_success "Plugin downloaded: ${PLUGIN_DIR}/fuse.js"
    else
        print_error "Failed to download plugin"
        exit 1
    fi
    
    # Download plugin manifest
    if curl -fsSL "${RAW_URL}/fuse-plugin.json" -o "${PLUGIN_DIR}/fuse-plugin.json"; then
        print_success "Manifest downloaded"
    else
        print_warning "Manifest download failed (optional)"
    fi
}

download_agents() {
    print_info "Downloading FUSE agents..."
    
    # Download main agents
    if curl -fsSL "${RAW_URL}/.opencode/agent/core/openagent.md" -o "${AGENT_DIR}/core/openagent.md"; then
        print_success "openagent.md installed"
    else
        print_warning "Failed to download openagent.md"
    fi
    
    if curl -fsSL "${RAW_URL}/.opencode/agent/core/opencoder.md" -o "${AGENT_DIR}/core/opencoder.md"; then
        print_success "opencoder.md installed"
    else
        print_warning "Failed to download opencoder.md"
    fi
    
    # Download subagents
    local subagents=(
        "contextscout.md"
        "externalscout.md"
        "task-manager.md"
        "memory-agent.md"
        "documentation.md"
        "context-retriever.md"
    )
    
    for sa in "${subagents[@]}"; do
        if curl -fsSL "${RAW_URL}/.opencode/agent/subagents/core/${sa}" -o "${AGENT_DIR}/subagents/core/${sa}"; then
            print_success "${sa} installed"
        else
            print_warning "Failed to download ${sa}"
        fi
    done
}

download_context() {
    print_info "Downloading FUSE context files..."
    
    # Download navigation
    if curl -fsSL "${RAW_URL}/.opencode/context/navigation.md" -o "${CONTEXT_DIR}/navigation.md"; then
        print_success "navigation.md installed"
    fi
    
    # Download core context directories
    local contexts=(
        "core/standards/code-quality.md"
        "core/workflows/session-management.md"
        "core/workflows/task-delegation-basics.md"
        "core/workflows/code-review.md"
        "core/standards/documentation.md"
        "core/standards/test-coverage.md"
    )
    
    for ctx in "${contexts[@]}"; do
        local dest="${CONTEXT_DIR}/${ctx}"
        mkdir -p "$(dirname "$dest")"
        if curl -fsSL "${RAW_URL}/.opencode/context/${ctx}" -o "$dest"; then
            print_success "${ctx} installed"
        fi
    done
}

install_memory() {
    print_info "Installing default memory files..."
    
    # Create default correction template
    cat > "${FUSE_DIR}/memory/corrections/default.json" << 'EOF'
{
  "id": "default_001",
  "memory_type": "correction",
  "content": {
    "what_was_wrong": "forgot tests",
    "correct_approach": "Always add tests for complex features",
    "timestamp": "2026-03-19T00:00:00Z"
  },
  "importance": 10,
  "created_at": "2026-03-19T00:00:00Z",
  "updated_at": "2026-03-19T00:00:00Z",
  "last_accessed": "2026-03-19T00:00:00Z",
  "access_count": 0,
  "lifecycle": "young",
  "tags": ["fuse_default"],
  "summary": "Remember to add tests"
}
EOF
    
    print_success "Memory templates installed"
}

configure_opencode() {
    print_info "Configuring OpenCode to load FUSE..."
    
    local opencode_json="${INSTALL_DIR}/opencode.json"
    
    # Create default config if doesn't exist
    if [ ! -f "$opencode_json" ]; then
        cat > "$opencode_json" << 'EOF'
{
  "plugins": []
}
EOF
        print_success "Created default OpenCode config"
    fi
    
    # Add FUSE to plugins array (if not already there)
    if grep -q "fuse.js" "$opencode_json" 2>/dev/null; then
        print_info "FUSE already configured in OpenCode"
    else
        # Use jq if available, otherwise simple sed
        if command -v jq &> /dev/null; then
            local tmp_file=$(mktemp)
            jq '.plugins += ["~/.config/opencode/plugin/fuse.js"] | unique' \
                "$opencode_json" > "$tmp_file" && mv "$tmp_file" "$opencode_json"
            print_success "Added FUSE to plugins (via jq)"
        else
            # Simple backup and append
            cp "$opencode_json" "${opencode_json}.bak"
            sed -i 's/"plugins": \[/"plugins": ["~\/.config\/opencode\/plugin\/fuse.js",/g' "$opencode_json" 2>/dev/null || \
            sed -i 's/"plugins": \[/"plugins": ['"'"'~/.config/opencode/plugin/fuse.js'"'"',/g' "$opencode_json"
            print_success "Added FUSE to plugins"
            print_warning "Manual review recommended: $opencode_json"
        fi
    fi
}

print_next_steps() {
    echo ""
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BOLD}                       Installation Complete!                     ${NC}"
    echo -e "${BOLD}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo -e "${GREEN}FUSE Plugin:${NC} ${PLUGIN_DIR}/fuse.js"
    echo -e "${GREEN}FUSE Memory:${NC} ${FUSE_DIR}/memory/"
    echo -e "${GREEN}Agents:${NC} ${AGENT_DIR}/"
    echo -e "${GREEN}Context:${NC} ${CONTEXT_DIR}/"
    echo ""
    echo -e "${BOLD}Next Steps:${NC}"
    echo ""
    echo "1. Restart OpenCode (or start a new session):"
    echo -e "   ${CYAN}opencode${NC}"
    echo ""
    echo "2. Test FUSE is loaded:"
    echo -e "   ${CYAN}fuse_status${NC}"
    echo ""
    echo "3. Analyze a task:"
    echo -e "   ${CYAN}fuse_analyze create a full-stack todo app${NC}"
    echo ""
    echo "4. Start a dynamic SPEC conversation:"
    echo -e "   ${CYAN}fuse_create_spec${NC}"
    echo ""
    echo "5. For updates/modifications:"
    echo -e "   ${CYAN}fuse_update${NC}"
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    print_info "Documentation: https://github.com/BandiAkarsh/fuse-openclode-plugin"
    print_info "Inspired by: https://github.com/darrenhinde/OpenAgentsControl"
}

#############################################################################
# Main
#############################################################################

main() {
    print_header
    
    echo -e "${CYAN}Installing FUSE Plugin...${NC}"
    echo ""
    
    check_dependencies
    check_opencode
    create_directories
    download_plugin
    download_agents
    download_context
    install_memory
    configure_opencode
    
    echo ""
    print_success "FUSE Plugin installed successfully!"
    echo ""
    
    print_next_steps
}

# Handle arguments
case "${1:-}" in
    --dry-run|-n)
        echo "Dry run - would install:"
        echo "  Plugin: ${PLUGIN_DIR}/fuse.js"
        echo "  Agents: ${AGENT_DIR}/"
        echo "  Context: ${CONTEXT_DIR}/"
        echo "  Memory: ${FUSE_DIR}/memory/"
        echo "  Config: ${INSTALL_DIR}/opencode.json"
        exit 0
        ;;
    --help|-h)
        echo "Usage: $0 [OPTIONS]"
        echo ""
        echo "Options:"
        echo "  --dry-run, -n    Show what would be installed"
        echo "  --help, -h       Show this help"
        echo ""
        echo "Environment:"
        echo "  OPENCODE_INSTALL_DIR    Installation directory (default: ~/.config/opencode)"
        exit 0
        ;;
    --agents-only)
        # Just install agents
        check_dependencies
        mkdir -p "$AGENT_DIR/core"
        mkdir -p "$AGENT_DIR/subagents/core"
        mkdir -p "$CONTEXT_DIR/core"
        download_agents
        download_context
        print_success "Agents installed!"
        exit 0
        ;;
esac

main
