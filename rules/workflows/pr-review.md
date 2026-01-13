# PR Review Workflow

## Overview
This workflow performs the actual code review analysis. Run this after completing the PR setup workflow and navigating to the worktree directory.

## Prerequisites
- PR setup workflow has been completed
- Currently in the PR worktree directory (e.g., `../pr-review-PR_NUMBER`)

## Workflow Steps

### Step 1: Fetch PR Metadata and Generate Analysis Files
Get PR_NUMBER from worktree name. (e.g. the name `pr-review-1234` indicates PR_NUMBER=1234)
If the worktree name is different, ask user to setup the worktree using `pr-setup.md` workflow and stop this workflow execution. (Don't try to infer PR_NUMBER)

```bash
# Create review files directory to organize analysis files
mkdir -p pr-review-PR_NUMBER

# Get PR information using GitHub CLI (preferred method)
gh pr view PR_NUMBER --json title,body,author,headRefName,baseRefName,url > pr-review-PR_NUMBER/pr-metadata.json

# Alternative: Get PR info using GitHub API if gh CLI not available
# curl -H "Accept: application/vnd.github.v3+json" \
#      https://api.github.com/repos/opensearch-project/sql/pulls/PR_NUMBER > pr-review-PR_NUMBER/pr-metadata.json

# Get the base branch (usually main or develop)
BASE_BRANCH="main"  # or "develop" depending on project

# Generate comprehensive diff (saved in review directory)
git diff $BASE_BRANCH...HEAD > pr-review-PR_NUMBER/pr-changes.diff

# Get list of changed files (saved in review directory)
git diff --name-only $BASE_BRANCH...HEAD > pr-review-PR_NUMBER/changed-files.txt

# Get detailed file statistics (saved in review directory)
git diff --stat $BASE_BRANCH...HEAD > pr-review-PR_NUMBER/diff-stats.txt
```

**Cline Actions:**
- Identify PR_NUMBER
- Use GitHub CLI (`gh`) to fetch PR metadata (title, description, author, branch info)
- Save PR metadata to `pr-review-PR_NUMBER/pr-metadata.json` for analysis
- Parse PR description for context and requirements
- Generate diff files for analysis in organized subdirectory
- Identify all modified, added, and deleted files
- Create summary of changes scope and impact

### Step 2: Initial Analysis
**Cline Actions:**
1. Read PR metadata from `pr-review-PR_NUMBER/pr-metadata.json`:
   - Parse PR title and description for context
   - Understand the author's intent and motivation
   - Identify linked issues or requirements
   - Note any breaking changes mentioned
   - Extract testing approach described

2. Read Memory Bank files for context:
   - `memory-bank/codeReview.md` - Review rubric
   - `memory-bank/systemPatterns.md` - Architecture patterns
   - `memory-bank/techContext.md` - Technical context
   - `memory-bank/projectbrief.md` - Project overview

3. Analyze changed files:
   - Read each modified file from `pr-review-PR_NUMBER/changed-files.txt`
   - Understand the scope of changes
   - Identify affected modules and components
   - Read relevant code from local workspace to better understand the context of the changes
   - Cross-reference changes with PR description

4. Summarize the analysis results into `pr-review-PR_NUMBER/pr-analysis.md`
   - Give PR information and quick change summary
   - Describe importatnt changes found in the analysis and show relevant code to understand the higher level logic/flow

**Note**: Provide specific file:line references for all findings to enable quick navigation to the code. Link caption should be file name (not full path). The file reference should start with "/" to correctly refer the file.

format:
```markdown
# PR Review Analysis

## PR Information
- **Title**: [Titile of the PR #PR_NUMBER](URL from pr-metadata.json)
- **Author**: [From pr-metadata.json]
- **Description**: [Summary from pr-metadata.json]

## Change Summary
- **Intent**: [What the PR aims to accomplish]
- **Scope**: [Affected modules and files]
- **Risk Level**: [High/Medium/Low with justification]
- **Breaking Changes**: [Yes/No with details]
- **Test Coverage**: [Assessment of testing approach]

## High Level Flow
Describe how the classes or components interact each other to help understand the high level flow, and how this PR contribute to the flow.

## Importatn changes

### Change1 title[`UserService.java:45`](/src/main/java/UserService.java#L45)
- Detailed descriptions as needed

[`UserService.java:45`](/src/main/java/UserService.java#L45)
// code snippet

[`RelatedService.java:30`](/src/main/java/RelatedService.java#L30)
// related code snippet as needed

### Change2 title[`UserService.java:45`](/src/main/java/UserService.java#L45)
- Detailed descriptions as needed
...

```


### Step 3: Collect Related PRs and Issues
**Cline Actions:**
1. Search for related PRs and Issues using GitHub CLI:
   - Search by keywords from PR title and description
   - Find PRs that modify similar files or components
   - Identify linked issues and dependencies
   - Look for recent PRs from the same author on related functionality

2. Collect and analyze relationships:
   ```bash
   # Search for related PRs by keywords (extract from PR title/description)
   gh pr list --search "keyword1 keyword2" --state all --limit 10 --json number,title,author,state,url
   
   # Search for related issues
   gh issue list --search "keyword1 keyword2" --state all --limit 10 --json number,title,author,state,url
   
   # Find PRs that modified similar files
   gh pr list --search "path:modified/file/path" --state all --limit 5 --json number,title,author,state,url
   
   # Get PRs from same author (recent context)
   gh pr list --author "AUTHOR_LOGIN" --state all --limit 5 --json number,title,author,state,url
   ```

3. Add related items to analysis document:
   - Summarize each related PR/Issue with brief description
   - Identify potential conflicts or dependencies
   - Note patterns or recurring themes
   - Highlight any blocking or prerequisite relationships

**Output Format in `pr-review-PR_NUMBER/pr-analysis.md`:**
```markdown
## Related PRs and Issues

### Related Pull Requests
1. **[#1234: Feature X Implementation](https://github.com/opensearch-project/sql/pull/1234)** - `merged`
   - **Author**: developer-name
   - **Summary**: Brief description of what this PR did
   - **Relationship**: How it relates to current PR (similar functionality, dependency, etc.)

2. **[#1235: Bug Fix for Component Y](https://github.com/opensearch-project/sql/pull/1235)** - `open`
   - **Author**: developer-name  
   - **Summary**: Brief description
   - **Relationship**: Potential conflict or dependency

### Related Issues
1. **[#567: Enhancement Request for Feature Z](https://github.com/opensearch-project/sql/issues/567)** - `open`
   - **Author**: user-name
   - **Summary**: Brief description of the issue
   - **Relationship**: This PR addresses/partially addresses this issue

2. **[#568: Bug Report](https://github.com/opensearch-project/sql/issues/568)** - `closed`
   - **Author**: user-name
   - **Summary**: Brief description
   - **Relationship**: Related bug that might be affected by this change

```


### Step 4: Structured Code Review
**Cline performs systematic review following the established rubric:**
Please use the collected information in earlier steps to provide effective feedback.

**Note**: Provide specific file:line references for all findings to enable quick navigation to the code. The reference should start with "/" to correctly refer the file. 

1. **Safety & Correctness Analysis**
   - Check API compatibility and breaking changes
   - Analyze concurrency, nullability, resource management
   - Validate input sanitization and security measures
   - Review error handling and edge cases

2. **Design & Maintainability Assessment**
   - Evaluate SOLID principles adherence
   - Check code cohesion and coupling
   - Assess naming conventions and testability
   - Identify complexity hotspots

3. **OpenSearch SQL Specific Review**
   - Validate parser changes (ANTLR grammar)
   - Check Calcite integration correctness
   - Ensure PPL compatibility
   - Review function library implementations

4. **Performance Analysis**
   - Identify hot path allocations
   - Check stream usage efficiency
   - Validate logging overhead
   - Review database query patterns

5. **Testing & Build Verification**
   - Assess test coverage for new code
   - Validate Gradle configuration changes
   - Check integration test compatibility

6. **Maintainability & Readability**
   - Assess code reundancy and readability
   - Opportunity for refactoring

### Step 5: Generate Review Output
**Cline adds structured review output to `pr-review-PR_NUMBER/pr-analysis.md`**

```markdown
## Risk Assessment (Top 10)
1. **[(Priority):Risk Category]** [`UserService.java:45`](/src/main/java/UserService.java#L45)
  - [Risk description]
  - Action Item: [Recommended action]

// code snippet as needed

2. **[(Priority):Risk Category]** [`filename:line`](/filename#L456)
  - [Risk description]
  - Action Item: [Recommended action]

// code snippet as needed

...

## Detailed Findings

### Safety & Correctness
1. **(Priority):Null Safety**: [`UserService.java:45`](/src/main/java/UserService.java#L45)
  - Missing null check for user parameter

// code snippet as needed


2. **(Priority):Resource Management**: [`DatabaseConnection.java:123`](/src/main/java/DatabaseConnection.java#L123)
  - Connection not properly closed in finally block

// code snippet as needed

...

### Design & Architecture
1. **(Priority)SOLID Violation**: [`OrderProcessor.java:89`](/src/main/java/OrderProcessor.java#L89) - Single Responsibility Principle violated, class handles both validation and processing

// code snippet as needed

2. **(Priority)Coupling**: [`PaymentService.java:156`](/src/main/java/PaymentService.java#L156) - Tight coupling to concrete implementation instead of interface

// code snippet as needed

...

### Performance Considerations
...

### Testing & Quality
...

### Maintainability & Readability
...

### Suggestions for further improvements
...

```

## Automation Commands for Analysis

### Complete Analysis Command
```bash
#!/bin/bash
# PR Analysis Script (run from worktree directory)
PR_NUMBER=$1
BASE_BRANCH=${2:-main}

if [ -z "$PR_NUMBER" ]; then
    echo "Usage: $0 <PR_NUMBER> [BASE_BRANCH]"
    exit 1
fi

echo "Starting PR analysis..."

# Create review files directory
mkdir -p pr-review-$PR_NUMBER

# Fetch PR metadata
echo "Fetching PR metadata..."
gh pr view $PR_NUMBER --json title,body,author,headRefName,baseRefName,url > pr-review-$PR_NUMBER/pr-metadata.json

# Generate analysis files
echo "Generating analysis files..."
git diff $BASE_BRANCH...HEAD > pr-review-$PR_NUMBER/pr-changes.diff
git diff --name-only $BASE_BRANCH...HEAD > pr-review-$PR_NUMBER/changed-files.txt
git diff --stat $BASE_BRANCH...HEAD > pr-review-$PR_NUMBER/diff-stats.txt

echo "Analysis files ready. Proceed with manual code review using Cline."
echo "Files available in pr-review-$PR_NUMBER/:"
echo "- pr-metadata.json (PR information)"
echo "- pr-changes.diff (complete diff)"
echo "- changed-files.txt (list of changed files)"
echo "- diff-stats.txt (change statistics)"
```

### Quick File Analysis
```bash
# Show summary of changes (assumes PR_NUMBER is set)
REVIEW_DIR="pr-review-${PR_NUMBER:-*}"
echo "=== PR Analysis Summary ==="
echo "Changed files: $(wc -l < $REVIEW_DIR/changed-files.txt)"
echo "Total lines changed:"
git diff --stat main...HEAD | tail -1
echo ""
echo "=== Changed Files ==="
cat $REVIEW_DIR/changed-files.txt
echo ""
echo "=== PR Metadata ==="
if command -v jq &> /dev/null; then
    echo "Title: $(jq -r '.title' $REVIEW_DIR/pr-metadata.json)"
    echo "Author: $(jq -r '.author.login' $REVIEW_DIR/pr-metadata.json)"
else
    echo "Install jq for formatted PR metadata display"
fi
```

## Usage Instructions

1. **Navigate to Worktree**: Ensure you're in the PR worktree directory
2. **Run Analysis**: Execute the analysis workflow
3. **Review Files**: Use Cline to systematically review changed files
4. **Generate Report**: Create structured review output
5. **Provide Feedback**: Deliver actionable recommendations

## Integration with Memory Bank

**During Analysis:**
- Reference code review rubric for systematic evaluation
- Apply project-specific knowledge from Memory Bank
- Identify deviations from established patterns
- Cross-reference with technical context and architecture decisions

This analysis workflow provides comprehensive, contextually-aware PR reviews while maintaining consistency with project standards.
