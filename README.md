# P6's POSIX.2: p6df-jira

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Aliases](#aliases)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

Install and configure Jira CLI for shell usage, with profile switching and
MCP server (`@modelcontextprotocol/server-atlassian`) for AI-driven issue management.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Aliases

- `jcli` -> `jira`

### Functions

#### p6df-jira

##### p6df-jira/init.zsh

- `p6df::modules::jira::aliases::init()`
- `p6df::modules::jira::deps()`
- `p6df::modules::jira::home::symlink()`
- `p6df::modules::jira::langs()`
- `p6df::modules::jira::mcp()`
- `p6df::modules::jira::profile::off()`
- `p6df::modules::jira::profile::on(profile, site, email, token)`
  - Args:
    - profile
    - site
    - email
    - token
- `str str = p6df::modules::jira::prompt::mod()`

## Hierarchy

```text
.
├── init.zsh
├── README.md
└── share

2 directories, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
