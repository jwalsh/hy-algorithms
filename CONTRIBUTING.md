# Contributing to Hy Algorithms

Thank you for considering contributing to Hy Algorithms! This document provides guidelines and instructions for contributing.

## Development Setup

1. Clone the repository
   ```bash
   git clone https://github.com/daidaitaotao/hy-algorithms.git
   cd hy-algorithms
   ```

2. Install development dependencies
   ```bash
   poetry install
   ```

## Commit Message Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/) specification for commit messages:

```
<type>(<scope>): <subject>
```

### Types
- **feat**: A new feature
- **fix**: A bug fix
- **docs**: Documentation only changes
- **style**: Changes that do not affect the meaning of the code
- **refactor**: A code change that neither fixes a bug nor adds a feature
- **perf**: A code change that improves performance
- **test**: Adding missing tests or correcting existing tests
- **chore**: Changes to the build process or auxiliary tools

### Attribution
For contributions from Claude or other AI assistants, use a trailer (not the body) for attribution:

```bash
git commit -m "feat(sorting): implement heap sort" --trailer="Co-authored-by: Claude <claude@anthropic.com>"
```

## Pull Request Process

1. Create a new branch with a descriptive name
2. Make your changes
3. Run the test suite to ensure your changes don't break existing functionality
4. Push your branch and submit a pull request
5. Wait for review and approval

## Code Style

- Follow the existing code style in the codebase
- Use kebab-case for all identifiers (functions, variables)
- Include docstrings with function description, parameters, return values, and complexity analysis

## Testing

- Write tests for all new features or bug fixes
- Run the test suite before submitting a pull request
  ```bash
  poetry run pytest
  ```