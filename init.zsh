######################################################################
#<
#
# Function: p6df::modules::jira::deps()
#
#>
######################################################################
p6df::modules::jira::deps() {
    ModuleDeps=(
        p6m7g8/p6df-js
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

  echo ln -fs $P6_DFZ_P6M7G8_SRC_DIR/p6df-jira/share/.jira-cli.json
#  ln -fs $P6_DFZ_P6M7G8_SRC_DIR/p6df-jira/share/.jira-cli.json
}
