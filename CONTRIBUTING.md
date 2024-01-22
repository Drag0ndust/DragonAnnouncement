# Contribution Guidelines
This document contains the rules and guidelines that developers are expected to follow, while contributing to this repository.

* All contributions must NOT add any warnings or errors. There is a GitHub action setup for any PRs to develop.

# About the Project

### Project Status

# Getting Started
## Prerequisites
* Download Xcode 15.0 or later, and macOS 14.0 or later.
* Install [SwiftFormat](https://github.com/nicklockwood/SwiftFormat) onto your machine via [Homebrew](https://brew.sh/)
* This is not a requirement, but is preferred.
```sh
brew install swiftformat
```

## Start Here
* Fork the repo to your profile
* Clone to your computer
* Setup the upstream remote

```sh
git remote add upstream <repo url here>
```

* **BEFORE** starting on an issue, comment on the issue you want to work on.
   * This prevents two people from working on the same issue. Thimo (aka Drag0ndust) (the maintainer) will assign you that issue, and you can get started on it.

* Checkout a new branch (from the `develop` branch) to work on an issue:

```sh
git checkout -b issueNumber-feature-name
```
* When your feature/fix is complete run SwiftFormat, open a pull request, PR, from your feature branch to the `develop` branch

# Branches and PRs
* No commits should be made to the `main` branch directly. The `main` branch shall only consist of the deployed code
* Developers are expected to work on feature branches, and upon successful development and testing, a PR (pull request) must be opened to merge with `develop`
* Use kebab-case for branch names
✅ **Examples of valid branch names:**
   * 8123-fix-title-of-issue (issue number)
   * 8123-feature-name (issue number)
  
❌ **Examples of invalid branch names**:
   * username-testing
   * attemptToFixAuth
   * SomethingRandom
