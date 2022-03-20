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

    npm install -g jira-cli
}

######################################################################
#<
#
# Function: p6df::modules::jira::home::symlink()
#
#>
######################################################################
p6df::modules::jira::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-jira/share/.jira-cli.json" ".jira-cli.json"
}
