# PR Review Setup Workflow

## Overview
This workflow sets up the environment for PR review by creating a worktree for the PR branch. Run this first before starting the actual review.

## Workflow Steps

### Step 1: Preparation - Configure Upstream Remote
```bash
# Check if upstream remote exists
git remote -v

# Add upstream remote if not present
if ! git remote | grep -q "upstream"; then
    git remote add upstream https://github.com/opensearch-project/sql.git
fi

# Fetch latest changes from upstream
git fetch upstream
```

**Cline Actions:**
- Check current git remote configuration
- Add upstream remote pointing to https://github.com/opensearch-project/sql.git if not already configured
- Fetch latest changes from upstream repository
- Verify upstream remote is properly configured

### Step 2: Fetch PR Code
```bash
# Get PR code changes
git fetch upstream pull/PR_NUMBER/head:pr-PR_NUMBER

# Alternative: If PR branch is already in remote
# git fetch upstream BRANCH_NAME:pr-BRANCH_NAME
```

**Cline Actions:**
- Execute git fetch commands to retrieve PR code changes
- Verify PR branch is available locally

### Step 3: Create Worktree for PR Branch
```bash
# Create a new worktree for the PR review
git worktree add ../sql.worktrees/pr-review-PR_NUMBER pr-PR_NUMBER
```

**Cline Actions:**
- Create isolated worktree for PR review
- Ensure clean separation from main development environment
- Verify worktree creation success

### Step 4: Open new window for PR Review
```bash
code ../sql.worktrees/pr-review-PR_NUMBER
```

**Cline Actions:**
- Run the command to open new VSCode window with the worktree
- Ask user to run `/pr-review.md` workflow in the new window

## Automation Command for Setup

```bash
#!/bin/bash
# PR Review Setup Script
PR_NUMBER=$1
BASE_BRANCH=${2:-main}

if [ -z "$PR_NUMBER" ]; then
    echo "Usage: $0 <PR_NUMBER> [BASE_BRANCH]"
    exit 1
fi

echo "Setting up PR review environment for PR #$PR_NUMBER..."

# Configure upstream remote if needed
if ! git remote | grep -q "upstream"; then
    echo "Adding upstream remote..."
    git remote add upstream https://github.com/opensearch-project/sql.git
fi
git fetch upstream

# Fetch PR code
echo "Fetching PR code..."
git fetch upstream pull/$PR_NUMBER/head:pr-$PR_NUMBER

# Create worktree
echo "Creating worktree..."
git worktree add ../pr-review-$PR_NUMBER pr-$PR_NUMBER

echo "Setup complete! Review environment ready at: ../pr-review-$PR_NUMBER"
echo "Next: Navigate to the worktree and run the pr-analysis workflow."
```

## Usage Instructions

1. **Run Setup**: Execute this workflow with PR number: `PR_NUMBER=123 BASE_BRANCH=main`
2. **Verify Environment**: Check that worktree is created successfully
3. **Navigate to Worktree**: User should manually navigate to `../pr-review-PR_NUMBER`
4. **Start Review**: Run the PR analysis workflow in the worktree directory to fetch metadata and generate analysis files

## Cleanup After Review

```bash
# Remove worktree
git worktree remove ../pr-review-PR_NUMBER

# Clean up local PR branch
git branch -D pr-PR_NUMBER
```

This setup workflow prepares everything needed for the review process and creates an isolated environment for analysis.
