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

    p6_js_npm_global_install "@pchuri/jira-cli"

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
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_SITE JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::prompt::mod() {
  local str

  if p6_string_blank_NOT "$P6_DFZ_PROFILE_JIRA"; then
    if p6_string_blank_NOT "$ATLASSIAN_SITE"; then
      str="jira:\t\t  $P6_DFZ_PROFILE_JIRA:"
      str=$(p6_string_append "$str" "$ATLASSIAN_SITE" " ")
    elif p6_string_blank_NOT "$JIRA_HOST"; then
      str="jira:\t\t  $P6_DFZ_PROFILE_JIRA:"
      str=$(p6_string_append "$str" "$JIRA_HOST" " ")
    fi

    if p6_string_blank_NOT "$ATLASSIAN_EMAIL"; then
      str=$(p6_string_append "$str" "$ATLASSIAN_EMAIL" "/")
    fi
    if p6_string_blank_NOT "$ATLASSIAN_API_TOKEN"; then
      str=$(p6_string_append "$str" "api" "/")
    fi
    if p6_string_blank_NOT "$JIRA_API_TOKEN"; then
      str=$(p6_string_append "$str" "japi" "/")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::on(profile, site, email, token)
#
#  Args:
#	profile -
#	site -
#	email -
#	token -
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::on() {
  local profile="$1"
  local site="$2"
  local email="$3"
  local token="$4"

  p6_env_export "P6_DFZ_PROFILE_JIRA" "$profile"

  # Atlassian shared auth
  p6_env_export "ATLASSIAN_SITE" "$site"
  p6_env_export "ATLASSIAN_EMAIL" "$email"
  p6_env_export "ATLASSIAN_API_TOKEN" "$token"

  # Jira CLI common vars
  p6_env_export "JIRA_HOST" "$site"
  p6_env_export "JIRA_API_TOKEN" "$token"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::profile::off()
#
#  Environment:	 ATLASSIAN_API_TOKEN ATLASSIAN_EMAIL ATLASSIAN_SITE JIRA_API_TOKEN JIRA_HOST P6_DFZ_PROFILE_JIRA
#>
######################################################################
p6df::modules::jira::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_JIRA

  p6_env_export_un ATLASSIAN_SITE
  p6_env_export_un ATLASSIAN_EMAIL
  p6_env_export_un ATLASSIAN_API_TOKEN

  p6_env_export_un JIRA_HOST
  p6_env_export_un JIRA_API_TOKEN

  p6_return_void
}
