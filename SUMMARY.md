# Hy Algorithms Repository Summary

## Repository Overview

This repository contains implementations of various sorting algorithms in Hy 1.0, a Lisp dialect that embeds within the Python ecosystem. The code focuses on specialized single-pass in-place sorting algorithms for different use cases.

## Directory Structure

```
hy-algorithms/
├── docs/                       # Documentation
│   ├── org_templates/          # Org-mode templates for literate programming
│   │   └── counting_sort.org   # Org-mode document for Counting Sort
│   ├── hy_implementation_notes.md  # Notes specific to Hy 1.0
│   └── sorting_decision_framework.md  # Decision framework for selecting sorting algorithms
├── src/                        # Source code
│   ├── sorting/                # Sorting algorithms
│   │   ├── __init__.py
│   │   ├── counting_sort.hy    # Counting Sort implementation
│   │   ├── dutch_national_flag.hy  # Dutch National Flag algorithm
│   │   ├── cycle_sort.hy       # Cycle Sort implementation
│   │   ├── radix_sort.hy       # Radix Sort implementation
│   │   ├── bucket_sort.hy      # Bucket Sort implementation
│   │   └── bitonic_sort.hy     # Bitonic Sort implementation
│   ├── __init__.py
│   ├── main.hy                 # Main demo entry point
│   └── hy_algorithms.py        # Python interface to Hy algorithms
├── tests/                      # Unit tests
│   ├── sorting/
│   │   ├── __init__.py
│   │   └── test_sorting.py     # Tests for sorting algorithms
├── .gitignore                  # Git ignore file
├── LICENSE                     # MIT License
├── Makefile                    # Makefile for running examples and tests
├── pyproject.toml              # Poetry configuration
├── README.md                   # Project README
├── SUMMARY.md                  # This summary file
└── setup.py                    # Setup script for installation
```

## Implemented Algorithms

The repository implements the following sorting algorithms:

1. **Counting Sort** - For small range integers
2. **Dutch National Flag** - For arrays with three distinct values
3. **Cycle Sort** - For arrays with values in range [1...n]
4. **Radix Sort** - For multi-digit numbers
5. **Bucket Sort** - For uniformly distributed values
6. **Bitonic Sort** - For hardware-accelerated environments

## Usage

### Running Examples

```bash
# Run all examples
make run

# Run specific algorithm example
make counting   # Counting Sort
make dutch      # Dutch National Flag
make cycle      # Cycle Sort
make radix      # Radix Sort
make bucket     # Bucket Sort
make bitonic    # Bitonic Sort
```

### Testing

```bash
# Run tests
make test
```

### From Python

```python
import hy
from src.hy_algorithms import sort

# Auto-select appropriate algorithm
arr = [4, 2, 2, 8, 3, 3, 1]
sort(arr)  # Sorts in-place

# Or specify algorithm
sort(arr, algorithm='counting', max_val=8)
```

### From Hy

```lisp
(import src.sorting.counting-sort)
(let [arr [4 2 2 8 3 3 1]]
  (src.sorting.counting-sort.counting-sort arr 8))
```

## Hy 1.0 Notes

This repository uses Hy 1.0, which has different import semantics compared to earlier versions. Key differences:

- Import full modules: `(import module.name)`
- Access functions using full path: `(module.name.function-name arg1 arg2)`
- List comprehensions use `lfor`: `(lfor i (range n) 0)`

See [Hy Implementation Notes](docs/hy_implementation_notes.md) for more details.

## Next Steps

Potential additions to the repository:

1. Add more sorting algorithms (Quick Sort, Merge Sort, etc.)
2. Implement data structures (Linked Lists, Trees, Heaps, etc.)
3. Add benchmarking tools for performance comparison
4. Create more detailed visualization tools using Mermaid
5. Add more comprehensive documentation with org-mode
