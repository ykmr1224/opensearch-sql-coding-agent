# Review Rubric (Java/Gradle)

## Safety & Correctness
- API changes & compatibility (breaking vs internal)
- Concurrency, nullability, resource mgmt, exception paths
- Input validation / security (injection, path traversal, deserialization)
- Edge cases: empty, large, timeouts, I/O failures

## Design & Maintainability
- SOLID, cohesion, coupling, naming, testability
- Separation of concerns (business vs infra), DI correctness
- Complexity hot spots (flag cyclomatic > 10, nested conditionals)

## Tests & Build
- New/changed behavior has tests; coverage of bugs/edges
- Gradle config correctness, task wiring, plugin versions

## Performance
- Hot path allocations, needless streams/copies, logging overhead

## Style / Hygiene
- Checkstyle/Spotless violations; dead code; TODOs with owners

## Review Instruction
Focus on **changed files** and **diff hunks**, not the entire repo.
- Summarize the change in 5 bullets (intent, scope, risky areas).
- List top 10 risks (ordered), each with a concrete action.
- Propose targeted inline comments (filename:line → comment).
- Suggest small patches (inline unified diffs) where easy.
- Call out any follow-up tasks (tests, docs, build config).
