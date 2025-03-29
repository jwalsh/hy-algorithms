# Hy Algorithms

A collection of algorithms and data structures implemented in the Hy programming language.

## About

This repository contains implementations of various algorithms and data structures in Hy, 
a Lisp dialect that embeds within the Python ecosystem.

## Structure

- `src/`: Implementation of algorithms and data structures
- `tests/`: Unit tests for implementations
- `docs/`: Documentation and explanation of algorithms

## Algorithms

### Sorting
- Counting Sort
- Dutch National Flag
- Cycle Sort
- Radix Sort
- Bucket Sort
- Bitonic Sort

## Usage

Each algorithm is implemented as a standalone Hy module. Example usage can be found
in the documentation and test files.

## Requirements

- Hy 1.0+
- Python 3.8+

## Hy 1.0 Notes

This repository uses Hy 1.0, which has different import semantics compared to earlier versions. See our [Hy Implementation Notes](docs/hy_implementation_notes.md) for details on working with Hy 1.0.

## Installation

```bash
# Clone this repository
git clone https://github.com/daidaitaotao/hy-algorithms.git
cd hy-algorithms

# Install with Poetry (recommended)
poetry install

# Or install with pip in development mode
pip install -e .
```

## Running Tests

```bash
# With Poetry
poetry run pytest tests/

# Or with pytest directly
pytest tests/
```

## Running Examples

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

## Contributors

- @daidaitaotao
- @jwalsh

## License

MIT
