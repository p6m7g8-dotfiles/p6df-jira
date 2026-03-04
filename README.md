# P6's POSIX.2: p6df-jira

## Table of Contents

- [Badges](#badges)
- [Summary](#summary)
- [Contributing](#contributing)
- [Code of Conduct](#code-of-conduct)
- [Usage](#usage)
  - [Functions](#functions)
- [Hierarchy](#hierarchy)
- [Author](#author)

## Badges

[![License](https://img.shields.io/badge/License-Apache%202.0-yellowgreen.svg)](https://opensource.org/licenses/Apache-2.0)

## Summary

Install and configure Jira, Confluence, and Figma CLIs for shell and Codex usage.

## Contributing

- [How to Contribute](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CONTRIBUTING.md>)

## Code of Conduct

- [Code of Conduct](<https://github.com/p6m7g8-dotfiles/.github/blob/main/CODE_OF_CONDUCT.md>)

## Usage

### Functions

#### p6df-jira

##### p6df-jira/init.zsh

- `p6df::modules::jira::aliases::init()`
- `p6df::modules::jira::deps()`
- `p6df::modules::jira::home::symlink()`
- `p6df::modules::jira::langs()`
- `p6df::modules::jira::profile::off()`
- `p6df::modules::jira::profile::on(profile, site, email, token, figma_token)`

## ENV

- Atlassian/Jira/Confluence:
  - `ATLASSIAN_SITE`
  - `ATLASSIAN_EMAIL`
  - `ATLASSIAN_API_TOKEN`
  - `JIRA_HOST`
  - `JIRA_API_TOKEN`
  - `CONFLUENCE_DOMAIN`
  - `CONFLUENCE_EMAIL`
  - `CONFLUENCE_API_TOKEN`
- Figma:
  - `FIGMA_API_TOKEN`
  - `FIGMA_TOKEN`
- Dotfiles profile:
  - `P6_DFZ_PROFILE_JIRA`

## Hierarchy

```text
.
├── init.zsh
└── README.md

1 directory, 2 files
```

## Author

Philip M. Gollucci <pgollucci@p6m7g8.com>
