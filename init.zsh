# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::jira::deps()
#
#>
######################################################################
p6df::modules::jira::deps() {
    ModuleDeps=(
        p6m7g8-dotfiles/p6df-atlassian
        p6m7g8-dotfiles/p6df-js
        netresearch/jira-skill
    )
}

######################################################################
#<
#
# Function: p6df::modules::jira::aliases::init()
#
#>
######################################################################
p6df::modules::jira::aliases::init() {

    local _module="$1"
    local _dir="$2"
    p6_alias "jcli" "jira"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::jira::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-jira/share/.jira-cli.json" "$HOME/.jira-cli.json"

  p6_file_symlink "$P6_DFZ_SRC_DIR/netresearch/jira-skill/skills/jira-communication" "$HOME/.claude/skills/jira-communication"
  p6_file_symlink "$P6_DFZ_SRC_DIR/netresearch/jira-skill/skills/jira-syntax"        "$HOME/.claude/skills/jira-syntax"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::langs()
#
#>
######################################################################
p6df::modules::jira::langs() {

    p6_js_npm_global_install "@pchuri/jira-cli"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::mcp()
#
#>
######################################################################
p6df::modules::jira::mcp() {

  p6_js_npm_global_install "@rokealvo/jira-mcp"

  p6df::modules::anthropic::mcp::server::add "jira" "npx" "-y" "@rokealvo/jira-mcp"
  p6df::modules::openai::mcp::server::add "jira" "npx" "-y" "@rokealvo/jira-mcp"

  p6_return_void
}

######################################################################
#<
#
# Function: words jira $JIRA_API_TOKEN = p6df::modules::jira::profile::mod()
#
#  Returns:
#	words - jira $JIRA_API_TOKEN
#
#  Environment:	 JIRA_API_TOKEN
#>
######################################################################
p6df::modules::jira::profile::mod() {

  p6_return_words 'jira' '$JIRA_API_TOKEN'
}
