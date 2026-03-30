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
# Function: p6df::modules::jira::aliases::init()
#
#>
######################################################################
p6df::modules::jira::aliases::init() {

    p6_alias "jcli" "jira"

    p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::jira::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::prompt::mod() {
  local str=""
  local profile="$P6_DFZ_PROFILE_JIRA"
  local host="$JIRA_HOST"
  local jira_api="$JIRA_API_TOKEN"

  if p6_string_blank_NOT "$profile"; then
    str="jira:\t\t  ${profile}:"
    if p6_string_blank_NOT "$host"; then
      str=$(p6_string_append "$str" "$host" " ")
    fi
    if p6_string_blank_NOT "$jira_api"; then
      str=$(p6_string_append "$str" "japi" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export JIRA_HOST=... JIRA_API_TOKEN=...)
#
#  Environment:	 JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_JIRA" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_JIRA

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
