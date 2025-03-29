.PHONY: setup run test clean

# Default target
all: setup run

# Setup development environment
setup:
	@echo "Setting up development environment..."
	pip install -e .
	pip install pytest

# Run the main application
run:
	@echo "Running sorting algorithm demonstrations..."
	hy src/main.hy

# Run tests
test:
	@echo "Running tests..."
	pytest tests/

# Run specific sorting algorithm demo
counting:
	@echo "Running Counting Sort demo..."
	hy -c "(import src.sorting.counting-sort) (let [arr [4 2 2 8 3 3 1]] (print \"Original array:\" arr) (src.sorting.counting-sort.counting-sort arr 8) (print \"Sorted array:\" arr))"

dutch:
	@echo "Running Dutch National Flag demo..."
	hy -c "(import src.sorting.dutch-national-flag) (let [arr [2 0 1 2 1 0 2 1 0]] (print \"Original array:\" arr) (src.sorting.dutch-national-flag.dutch-national-flag arr) (print \"Sorted array:\" arr))"

cycle:
	@echo "Running Cycle Sort demo..."
	hy -c "(import src.sorting.cycle-sort) (let [arr [5 4 3 2 1]] (print \"Original array:\" arr) (src.sorting.cycle-sort.cycle-sort arr) (print \"Sorted array:\" arr))"

radix:
	@echo "Running Radix Sort demo..."
	hy -c "(import src.sorting.radix-sort) (let [arr [170 45 75 90 802 24 2 66]] (print \"Original array:\" arr) (src.sorting.radix-sort.radix-sort arr 3) (print \"Sorted array:\" arr))"

bucket:
	@echo "Running Bucket Sort demo..."
	hy -c "(import src.sorting.bucket-sort) (let [arr [0.42 0.32 0.33 0.52 0.37 0.47 0.51]] (print \"Original array:\" arr) (src.sorting.bucket-sort.bucket-sort arr) (print \"Sorted array:\" arr))"

bitonic:
	@echo "Running Bitonic Sort demo..."
	hy -c "(import src.sorting.bitonic-sort) (let [arr [3 7 4 8 6 2 1 5]] (print \"Original array:\" arr) (src.sorting.bitonic-sort.sort-array arr) (print \"Sorted array:\" arr))"

# Clean up generated files
clean:
	@echo "Cleaning up..."
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -rf build/ dist/
