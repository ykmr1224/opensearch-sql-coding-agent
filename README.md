# OpenSearch SQL Coding Agent

Coding Agent configuration customized for OpenSearch-SQL development with Memory Bank system and development standards.

## What This Provides
- **Memory Bank System**: Persistent context across sessions
- **Development Standards**: Java coding standards and OpenSearch patterns
- **Testing Requirements**: Built-in testing standards
- **Workflow Integration**: Automated development patterns

## Structure
```
opensearch-sql-coding-agent/
├── README.md                          # This file
├── LICENSE                            # MIT License
├── git-post-checkout.sh              # Git hook for worktree setup
├── rules/                             # Development rules and standards
│   ├── 00-important.md               # Key development notes
│   ├── 01-memory-bank.md             # Memory Bank system integration
│   ├── 02-java-standards.md          # Java development standards
│   ├── 03-opensearch-project.md      # OpenSearch-specific guidelines
│   ├── 04-testing.md                 # Testing requirements
│   ├── 05-workflow.md                # Development workflow patterns
│   └── workflows/                    # Automated workflow definitions
│       ├── pr-setup.md               # PR review environment setup
│       └── pr-analysis.md            # PR code review and analysis
└── memory-bank/                      # Memory Bank core files
    ├── projectbrief.md               # Project foundation and scope
    ├── productContext.md             # Product goals and user experience
    ├── systemPatterns.md             # Architecture and design patterns
    ├── techContext.md                # Technical setup and dependencies
    ├── features/                     # Feature investigation system
    │   └── README.md                 # Feature documentation guide
    ├── opensearch-specific/          # OpenSearch-specialized documentation
    │   ├── calcite-integration.md    # Calcite integration patterns
    │   ├── module-architecture.md    # Module organization patterns
    │   └── ppl-parser-patterns.md    # PPL parser implementation
    └── temporal/                     # Temporal context files
        └── README.md                 # Temporal documentation guide
```

## How It Works
Cline automatically reads all Memory Bank files at session start to understand project state and applies development standards.

## Memory Bank Core Files
- **projectbrief.md**: Project scope and requirements
- **productContext.md**: Why project exists and user goals
- **systemPatterns.md**: Architecture decisions and patterns
- **techContext.md**: Technologies and dependencies

## Setup Instructions

To use this Memory Bank system with your OpenSearch SQL project:

1. **Clone this repository** (if you haven't already):
   ```bash
   git clone https://github.com/ykmr1224/opensearch-sql-coding-agent.git
   ```

2. **Create symbolic links** from your project directory:
   ```bash
   cd /path/to/your/opensearch-sql-project
   ln -s /path/to/opensearch-sql-coding-agent/rules .clinerules
   ln -s /path/to/opensearch-sql-coding-agent/memory-bank memory-bank
   ```

3. **Set up git hook** so worktrees can automatically link to the rules and memory-bank

Copy contents of `git-post-checkout.sh` into `.git/hooks/post-checkout`

4. **Start Cline** - it will automatically detect the `.clinerules` folder and load all Memory Bank files and development standards.

## Usage
Once the symbolic link is created, Cline automatically reads all Memory Bank files at session start to understand project state and applies development standards.
