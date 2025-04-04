# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands
```bash
# Installation
pip install -e .
# Or with Poetry
poetry install
# Or with uv (faster alternative to pip)
uv pip install -e .

# Create and activate a virtual environment
python -m venv .venv
source .venv/bin/activate  # Linux/Mac
# OR .venv\Scripts\activate  # Windows

# Run all tests
pytest tests/
# Run specific test
pytest tests/sorting/test_sorting.py::test_counting_sort

# Run specific algorithm demo 
make counting   # Or: dutch, cycle, radix, bucket, bitonic
# Or directly with Hy (use single quotes to preserve double quotes)
hy -c '(import src.sorting.bucket-sort) (let [arr [0.42 0.32 0.33 0.52 0.37]] (print "Original array:" arr) (src.sorting.bucket-sort.bucket-sort arr) (print "Sorted array:" arr))'

# Format/lint Hy code (if tools installed)
hy -m hyfmt src/
```

## Style Guidelines
- **Language**: Hy 1.0+ (Lisp dialect for Python ecosystem)
- **Naming**: Use kebab-case for all identifiers (functions, variables)
- **Documentation**: Include docstrings with function purpose, parameters, returns, time/space complexity, and constraints
- **Imports**: Use `(import module.name)` format, not bracket-style imports
- **List Comprehensions**: Use `lfor` macro (e.g., `(lfor i (range n) 0)` creates a list of n zeros)
- **Conditionals**: Use nested `if` instead of `cond` for complex conditionals (Hy 1.0 `cond` requires even number of args)
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
- Entry point in src/main.hy for running all algorithm demos

## Version Compatibility
- Compatible with Hy 1.0+
- Requires Python 3.8+
- Project uses pytest 7.0.0+ for testing

## Git Workflow
- Use conventional commits format for all commit messages
- For Claude attributions, use `--trailer` not the commit message body
- Use `--no-gpg-sign` for all git operations