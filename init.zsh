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

    p6_js_npm_global_install "jira-cli"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::jira::home::symlink()
#
#  Environment:	 P6_DFZ_P6M7G8_SRC_DIR
#>
######################################################################
p6df::modules::jira::home::symlink() {

    p6_file_symlink "$P6_DFZ_P6M7G8_SRC_DIR/p6df-jira/share/.jira-cli.json" .jira-cli.json

    p6_return_void
}
