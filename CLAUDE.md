# HY ALGORITHMS DEVELOPMENT GUIDE

## Commands
```bash
# Installation
pip install -e .
# Or with Poetry
poetry install

# Run all tests
pytest tests/
# Run specific test
pytest tests/sorting/test_sorting.py::test_counting_sort

# Run specific algorithm demo 
make counting   # Or: dutch, cycle, radix, bucket, bitonic
# Or directly with Hy
hy -c "(import src.sorting.bucket-sort)"
```

## :important: Git Workflow
- Use conventional commits format for all commit messages
- For Claude attributions, use `--trailer` not the commit message body
- Use `--no-gpg-sign` for all git operations
- Avoid interactive commands (e.g., rebase, emacs without --batch, sudo, etc.)

## Style Guidelines
- **Language**: Hy 1.0+ (Lisp dialect for Python ecosystem)
- **Naming**: Use kebab-case for all identifiers (functions, variables)
- **Documentation**: Include docstrings with function purpose, parameters, returns, time/space complexity, and constraints
- **Imports**: Keep imports minimal, group standard library and third-party imports
- **Error Handling**: Document algorithm constraints in docstrings rather than runtime checks
- **Testing**: Create algorithm-specific test cases in tests/sorting directory using pytest

## Function Pattern
```hy
(defn function-name [param1 param2]
  "Short description of what the function does.
  
  Parameters:
    param1: Description of param1
    param2: Description of param2
    
  Returns:
    Description of return value
    
  Time Complexity: O(...)
  Space Complexity: O(...)
  Constraints: Any limitations of the algorithm"
  ;; Implementation
  )
```

## Code Organization
- Algorithms are organized by category in src/
- Each algorithm has its own module
- Tests follow same structure in tests/
- Usage examples provided at end of modules with #_ syntax