# Important things to note
- Use `./gradlew :integ-test:integTest` for running integration tests.
- Always prefer simpler solution unless there is major functional/performance degradation.
- When writing code, prefer simple and concise code. Please avoid redundant code or repetitive code.
- Don't add redundant comment which can be known from the code itself.
- Write self descriptive code which doesn't require comment to explain the logic. (Comments are the last resort to rely on.)
- Keep notes, docs, and source code short and concise.
- When writing notes, please omit less important things and focus on most important parts to avoid context size growth.
- Once you make code change, run relevant tests and verify the change is working as expected.
- Don't leave failing test as it is, and try to fix until all pass. You can ask decision if you see any blocker.
