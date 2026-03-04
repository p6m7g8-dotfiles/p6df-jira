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
        p6m7g8-dotfiles/p6df-js
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

    # Jira + Confluence community CLIs
    p6_js_npm_global_install "@pchuri/jira-cli"
    p6_js_npm_global_install "confluence-cli"

    # Figma CLI tools
    p6_js_npm_global_install "@figma-export/cli"
    p6_js_npm_global_install "figma-developer-mcp"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::home::symlink()
#
#  Environment:	 P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::jira::home::symlink() {

    p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-jira/share/.jira-cli.json" "$HOME/.jira-cli.json"

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
    p6_alias "ccli" "confluence"
    p6_alias "fcli" "figma-export"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::on(profile, site, email, token, figma_token)
#
#  Args:
#	profile -
#	site -
#	email -
#	token -
#	figma_token -
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL FIGMA_API_TOKEN FIGMA_TOKEN JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::on() {
  local profile="$1"
  local site="$2"
  local email="$3"
  local token="$4"
  local figma_token="${5:-}"

  p6_env_export "P6_DFZ_PROFILE_JIRA" "$profile"

  # Atlassian shared auth
  p6_env_export "ATLASSIAN_SITE" "$site"
  p6_env_export "ATLASSIAN_EMAIL" "$email"
  p6_env_export "ATLASSIAN_API_TOKEN" "$token"

  # Jira CLI common vars
  p6_env_export "JIRA_HOST" "$site"
  p6_env_export "JIRA_API_TOKEN" "$token"

  # Confluence CLI common vars
  p6_env_export "CONFLUENCE_DOMAIN" "$site"
  p6_env_export "CONFLUENCE_EMAIL" "$email"
  p6_env_export "CONFLUENCE_API_TOKEN" "$token"

  if p6_string_blank_NOT "$figma_token"; then
    p6_env_export "FIGMA_API_TOKEN" "$figma_token"
    p6_env_export "FIGMA_TOKEN" "$figma_token"
  fi

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::off()
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE CONFLUENCE_API_TOKEN CONFLUENCE_DOMAIN CONFLUENCE_EMAIL FIGMA_API_TOKEN FIGMA_TOKEN JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_JIRA

  p6_env_export_un ATLASSIAN_SITE
  p6_env_export_un ATLASSIAN_EMAIL
  p6_env_export_un ATLASSIAN_API_TOKEN

  p6_env_export_un JIRA_HOST
  p6_env_export_un JIRA_API_TOKEN

  p6_env_export_un CONFLUENCE_DOMAIN
  p6_env_export_un CONFLUENCE_EMAIL
  p6_env_export_un CONFLUENCE_API_TOKEN

  p6_env_export_un FIGMA_API_TOKEN
  p6_env_export_un FIGMA_TOKEN

  p6_return_void
}
