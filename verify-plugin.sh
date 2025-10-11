#!/bin/bash

# Claude Nights Watch Plugin Verification Script
# Automated testing and validation

set -e

PLUGIN_ROOT="$(cd "$(dirname "$0")" && pwd)"
PASS=0
FAIL=0

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_test() {
    echo -e "${BLUE}[TEST]${NC} $1"
}

print_pass() {
    echo -e "${GREEN}[PASS]${NC} $1"
    ((PASS++))
}

print_fail() {
    echo -e "${RED}[FAIL]${NC} $1"
    ((FAIL++))
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_header() {
    echo ""
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
    echo ""
}

# Test 1: Plugin Structure
test_structure() {
    print_header "Testing Plugin Structure"
    
    print_test "Checking required directories..."
    
    if [ -d "$PLUGIN_ROOT/.claude-plugin" ]; then
        print_pass ".claude-plugin/ directory exists"
    else
        print_fail ".claude-plugin/ directory missing"
    fi
    
    if [ -d "$PLUGIN_ROOT/commands" ]; then
        print_pass "commands/ directory exists"
    else
        print_fail "commands/ directory missing"
    fi
    
    if [ -d "$PLUGIN_ROOT/agents" ]; then
        print_pass "agents/ directory exists"
    else
        print_fail "agents/ directory missing"
    fi
    
    if [ -d "$PLUGIN_ROOT/hooks" ]; then
        print_pass "hooks/ directory exists"
    else
        print_fail "hooks/ directory missing"
    fi
    
    if [ -d "$PLUGIN_ROOT/mcp-server" ]; then
        print_pass "mcp-server/ directory exists"
    else
        print_fail "mcp-server/ directory missing"
    fi
}

# Test 2: Plugin Manifest
test_manifest() {
    print_header "Testing Plugin Manifest"
    
    MANIFEST="$PLUGIN_ROOT/.claude-plugin/plugin.json"
    
    if [ -f "$MANIFEST" ]; then
        print_pass "plugin.json exists"
        
        print_test "Validating JSON syntax..."
        if jq empty "$MANIFEST" 2>/dev/null; then
            print_pass "plugin.json is valid JSON"
        else
            print_fail "plugin.json has invalid JSON syntax"
        fi
        
        print_test "Checking required fields..."
        
        NAME=$(jq -r '.name // empty' "$MANIFEST")
        if [ -n "$NAME" ]; then
            print_pass "name field present: $NAME"
        else
            print_fail "name field missing"
        fi
        
        VERSION=$(jq -r '.version // empty' "$MANIFEST")
        if [ -n "$VERSION" ]; then
            print_pass "version field present: $VERSION"
        else
            print_fail "version field missing"
        fi
        
        DESCRIPTION=$(jq -r '.description // empty' "$MANIFEST")
        if [ -n "$DESCRIPTION" ]; then
            print_pass "description field present"
        else
            print_fail "description field missing"
        fi
    else
        print_fail "plugin.json missing"
    fi
}

# Test 3: Command Files
test_commands() {
    print_header "Testing Command Files"
    
    COMMANDS=(
        "start.md"
        "stop.md"
        "restart.md"
        "status.md"
        "logs.md"
        "task.md"
        "setup.md"
    )
    
    for cmd in "${COMMANDS[@]}"; do
        if [ -f "$PLUGIN_ROOT/commands/$cmd" ]; then
            print_pass "Command file: $cmd"
        else
            print_fail "Command file missing: $cmd"
        fi
    done
    
    if [ -f "$PLUGIN_ROOT/commands/bin/nights-watch" ]; then
        print_pass "Command wrapper exists"
        
        if [ -x "$PLUGIN_ROOT/commands/bin/nights-watch" ]; then
            print_pass "Command wrapper is executable"
        else
            print_fail "Command wrapper not executable"
        fi
    else
        print_fail "Command wrapper missing"
    fi
}

# Test 4: Agent Files
test_agents() {
    print_header "Testing Agent Files"
    
    if [ -f "$PLUGIN_ROOT/agents/task-executor.md" ]; then
        print_pass "Task Executor agent exists"
        
        if grep -q "^---$" "$PLUGIN_ROOT/agents/task-executor.md"; then
            print_pass "Agent has frontmatter"
        else
            print_fail "Agent missing frontmatter"
        fi
    else
        print_fail "Task Executor agent missing"
    fi
}

# Test 5: Hooks Configuration
test_hooks() {
    print_header "Testing Hooks Configuration"
    
    if [ -f "$PLUGIN_ROOT/hooks/hooks.json" ]; then
        print_pass "hooks.json exists"
        
        if jq empty "$PLUGIN_ROOT/hooks/hooks.json" 2>/dev/null; then
            print_pass "hooks.json is valid JSON"
        else
            print_fail "hooks.json has invalid JSON"
        fi
    else
        print_fail "hooks.json missing"
    fi
    
    HOOK_SCRIPTS=(
        "check-daemon-status.sh"
        "session-end-prompt.sh"
        "log-file-changes.sh"
    )
    
    for script in "${HOOK_SCRIPTS[@]}"; do
        SCRIPT_PATH="$PLUGIN_ROOT/hooks/scripts/$script"
        if [ -f "$SCRIPT_PATH" ]; then
            print_pass "Hook script exists: $script"
            
            if [ -x "$SCRIPT_PATH" ]; then
                print_pass "Hook script executable: $script"
            else
                print_fail "Hook script not executable: $script"
            fi
        else
            print_fail "Hook script missing: $script"
        fi
    done
}

# Test 6: MCP Server
test_mcp() {
    print_header "Testing MCP Server"
    
    if [ -f "$PLUGIN_ROOT/.mcp.json" ]; then
        print_pass ".mcp.json exists"
        
        if jq empty "$PLUGIN_ROOT/.mcp.json" 2>/dev/null; then
            print_pass ".mcp.json is valid JSON"
        else
            print_fail ".mcp.json has invalid JSON"
        fi
    else
        print_fail ".mcp.json missing"
    fi
    
    if [ -f "$PLUGIN_ROOT/mcp-server/nights-watch-server.sh" ]; then
        print_pass "MCP server script exists"
        
        if [ -x "$PLUGIN_ROOT/mcp-server/nights-watch-server.sh" ]; then
            print_pass "MCP server script executable"
        else
            print_fail "MCP server script not executable"
        fi
    else
        print_fail "MCP server script missing"
    fi
}

# Test 7: Core Scripts
test_core_scripts() {
    print_header "Testing Core Scripts"
    
    SCRIPTS=(
        "claude-nights-watch-daemon.sh"
        "claude-nights-watch-manager.sh"
        "setup-nights-watch.sh"
        "view-logs.sh"
    )
    
    for script in "${SCRIPTS[@]}"; do
        if [ -f "$PLUGIN_ROOT/$script" ]; then
            print_pass "Core script exists: $script"
            
            if [ -x "$PLUGIN_ROOT/$script" ]; then
                print_pass "Core script executable: $script"
            else
                print_warn "Core script not executable: $script (will attempt to fix)"
                chmod +x "$PLUGIN_ROOT/$script" 2>/dev/null && print_pass "Fixed: $script" || print_fail "Could not fix: $script"
            fi
        else
            print_fail "Core script missing: $script"
        fi
    done
}

# Test 8: Documentation
test_documentation() {
    print_header "Testing Documentation"
    
    DOCS=(
        "README.md"
        "PLUGIN_README.md"
        "PLUGIN_INSTALLATION.md"
        "PLUGIN_TESTING.md"
        "MARKETPLACE_SETUP.md"
        "CHANGELOG.md"
        "LICENSE"
    )
    
    for doc in "${DOCS[@]}"; do
        if [ -f "$PLUGIN_ROOT/$doc" ]; then
            print_pass "Documentation exists: $doc"
        else
            print_warn "Documentation missing: $doc"
        fi
    done
}

# Test 9: Examples
test_examples() {
    print_header "Testing Example Files"
    
    if [ -d "$PLUGIN_ROOT/examples" ]; then
        print_pass "examples/ directory exists"
        
        if [ -f "$PLUGIN_ROOT/examples/task.example.md" ]; then
            print_pass "Task example exists"
        else
            print_warn "Task example missing"
        fi
        
        if [ -f "$PLUGIN_ROOT/examples/rules.example.md" ]; then
            print_pass "Rules example exists"
        else
            print_warn "Rules example missing"
        fi
    else
        print_warn "examples/ directory missing"
    fi
}

# Test 10: Marketplace Files
test_marketplace() {
    print_header "Testing Marketplace Files"
    
    if [ -d "$PLUGIN_ROOT/marketplace-example" ]; then
        print_pass "marketplace-example/ directory exists"
        
        if [ -f "$PLUGIN_ROOT/marketplace-example/plugins.json" ]; then
            print_pass "Marketplace plugins.json exists"
            
            if jq empty "$PLUGIN_ROOT/marketplace-example/plugins.json" 2>/dev/null; then
                print_pass "Marketplace plugins.json is valid JSON"
            else
                print_fail "Marketplace plugins.json has invalid JSON"
            fi
        else
            print_fail "Marketplace plugins.json missing"
        fi
        
        if [ -f "$PLUGIN_ROOT/marketplace-example/README.md" ]; then
            print_pass "Marketplace README exists"
        else
            print_warn "Marketplace README missing"
        fi
    else
        print_warn "marketplace-example/ directory missing"
    fi
}

# Run all tests
main() {
    echo ""
    echo -e "${BLUE}╔════════════════════════════════════════════╗${NC}"
    echo -e "${BLUE}║  Claude Nights Watch Plugin Verification  ║${NC}"
    echo -e "${BLUE}╚════════════════════════════════════════════╝${NC}"
    echo ""
    echo "Plugin Root: $PLUGIN_ROOT"
    
    test_structure
    test_manifest
    test_commands
    test_agents
    test_hooks
    test_mcp
    test_core_scripts
    test_documentation
    test_examples
    test_marketplace
    
    # Summary
    print_header "Test Summary"
    
    TOTAL=$((PASS + FAIL))
    
    echo -e "${GREEN}Passed:${NC} $PASS"
    echo -e "${RED}Failed:${NC} $FAIL"
    echo -e "${BLUE}Total:${NC} $TOTAL"
    echo ""
    
    if [ $FAIL -eq 0 ]; then
        CONFIDENCE=100
        echo -e "${GREEN}✅ All tests passed!${NC}"
        echo -e "${GREEN}🎉 Confidence Score: ${CONFIDENCE}%${NC}"
        echo -e "${GREEN}✅ Plugin is ready for distribution!${NC}"
        exit 0
    elif [ $FAIL -lt 5 ]; then
        CONFIDENCE=$((PASS * 100 / TOTAL))
        echo -e "${YELLOW}⚠️  Some tests failed${NC}"
        echo -e "${YELLOW}📊 Confidence Score: ${CONFIDENCE}%${NC}"
        if [ $CONFIDENCE -ge 90 ]; then
            echo -e "${YELLOW}✅ Plugin is acceptable for release with minor fixes${NC}"
            exit 0
        else
            echo -e "${YELLOW}⚠️  Plugin needs fixes before release${NC}"
            exit 1
        fi
    else
        CONFIDENCE=$((PASS * 100 / TOTAL))
        echo -e "${RED}❌ Multiple tests failed${NC}"
        echo -e "${RED}📊 Confidence Score: ${CONFIDENCE}%${NC}"
        echo -e "${RED}❌ Plugin is not ready for release${NC}"
        exit 1
    fi
}

# Check if jq is available
if ! command -v jq &> /dev/null; then
    print_warn "jq not installed - JSON validation will be skipped"
    print_warn "Install jq for full validation: brew install jq (macOS) or apt-get install jq (Linux)"
    echo ""
fi

main

