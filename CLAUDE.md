# Claude Instructions

## Commit Guidelines

Always use conventional commits when creating git commits. Follow this format:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Common Types:
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `build`: Changes that affect the build system or external dependencies
- `ci`: Changes to CI configuration files and scripts
- `chore`: Other changes that don't modify src or test files

### Examples:
```
feat: add dark mode toggle to header
fix: resolve CSS variable inheritance issue
docs: update README with installation instructions
style: format CSS with consistent indentation
```