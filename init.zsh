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
  local str=""
  local profile="${P6_DFZ_PROFILE_JIRA:-}"
  local site="${ATLASSIAN_SITE:-}"
  local host="${JIRA_HOST:-}"
  local email="${ATLASSIAN_EMAIL:-}"
  local atlassian_api="${ATLASSIAN_API_TOKEN:-}"
  local jira_api="${JIRA_API_TOKEN:-}"

  if p6_string_blank_NOT "$profile"; then
    str="jira:\t\t  ${profile}:"

    if p6_string_blank_NOT "$site"; then
      str=$(p6_string_append "$str" "$site" " ")
    elif p6_string_blank_NOT "$host"; then
      str=$(p6_string_append "$str" "$host" " ")
    fi

    if p6_string_blank_NOT "$email"; then
      str=$(p6_string_append "$str" "$email" "/")
    fi
    if p6_string_blank_NOT "$atlassian_api"; then
      str=$(p6_string_append "$str" "api" "/")
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
