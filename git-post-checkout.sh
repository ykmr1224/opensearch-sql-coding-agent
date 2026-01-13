#!/bin/bash
# Git post-checkout hook to automatically create .clinerules / memory-bank symlink in worktrees

CONFIG_REPOSITORY="../../opensearch-sql-coding-agent"
RULES_DIR=".clinerules"
MEMORY_BANK_DIR="memory-bank"
# Only run for branch checkouts (not file checkouts)
if [ "$3" = "1" ]; then
    # Check if we're in a worktree (not the main repository)
    if [ -f .git ] && grep -q "gitdir:" .git; then
        # Only create the symlink if it doesn't already exist
        if [ ! -e $RULES_DIR ]; then
            ln -s $CONFIG_REPOSITORY/rules $RULES_DIR
            echo "Created $RULES_DIR symbolic link in worktree: $(pwd)"
        fi
        if [ ! -e $MEMORY_BANK_DIR ]; then
            ln -s $CONFIG_REPOSITORY/memory-bank $MEMORY_BANK_DIR
            echo "Created $MEMORY_BANK_DIR symbolic link in worktree: $(pwd)"
        fi
    fi
fi
