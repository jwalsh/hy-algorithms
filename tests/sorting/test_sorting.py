import pytest
import hy
from src.sorting.counting_sort import counting_sort
from src.sorting.dutch_national_flag import dutch_national_flag
from src.sorting.cycle_sort import cycle_sort
from src.sorting.radix_sort import radix_sort
from src.sorting.bucket_sort import bucket_sort
from src.sorting.bitonic_sort import sort_array as bitonic_sort

# Test cases for all sorting algorithms
test_cases = [
    [],  # Empty array
    [1],  # Single element
    [1, 1, 1],  # All same elements
    [5, 4, 3, 2, 1],  # Reverse sorted
    [1, 2, 3, 4, 5],  # Already sorted
    [1, 5, 2, 4, 3],  # Random order
]

def test_counting_sort():
    """Test counting sort algorithm."""
    for arr in test_cases:
        if not arr:  # Skip empty arrays
            continue
        
        # Create a copy for testing
        test_arr = arr.copy()
        max_val = max(test_arr) if test_arr else 0
        
        # Apply counting sort
        counting_sort(test_arr, max_val)
        
        # Compare with Python's built-in sort
        assert test_arr == sorted(arr), f"Counting sort failed for {arr}"

def test_dutch_national_flag():
    """Test Dutch National Flag algorithm."""
    # Only test with arrays containing 0, 1, 2
    test_arrays = [
        [0, 1, 2, 0, 1, 2],
        [2, 2, 0, 0, 1, 1],
        [1, 1, 1],
        [0],
        [],
    ]
    
    for arr in test_arrays:
        test_arr = arr.copy()
        dutch_national_flag(test_arr)
        assert test_arr == sorted(arr), f"Dutch National Flag failed for {arr}"

def test_cycle_sort():
    """Test cycle sort algorithm."""
    for arr in test_cases:
        if not arr:  # Skip empty arrays
            continue
            
        test_arr = arr.copy()
        cycle_sort(test_arr)
        assert test_arr == sorted(arr), f"Cycle sort failed for {arr}"

def test_radix_sort():
    """Test radix sort algorithm."""
    # Test only with positive integers
    test_arrays = [
        [170, 45, 75, 90, 802, 24, 2, 66],
        [10, 1, 100, 1000, 10000],
        [5, 5, 5, 5],
        [9],
        [],
    ]
    
    for arr in test_arrays:
        if not arr:  # Skip empty arrays
            continue
            
        test_arr = arr.copy()
        max_digits = len(str(max(arr)))
        radix_sort(test_arr, max_digits)
        assert test_arr == sorted(arr), f"Radix sort failed for {arr}"

def test_bucket_sort():
    """Test bucket sort algorithm."""
    # Test with floating point numbers
    test_arrays = [
        [0.42, 0.32, 0.33, 0.52, 0.37, 0.47, 0.51],
        [0.9, 0.8, 0.7, 0.6, 0.5],
        [0.1, 0.1, 0.1],
        [0.5],
        [],
    ]
    
    for arr in test_arrays:
        if not arr:  # Skip empty arrays
            continue
            
        test_arr = arr.copy()
        bucket_sort(test_arr)
        
        # Compare with sorted array (with floating point tolerance)
        expected = sorted(arr)
        for i in range(len(test_arr)):
            assert abs(test_arr[i] - expected[i]) < 1e-10, f"Bucket sort failed for {arr}"

def test_bitonic_sort():
    """Test bitonic sort algorithm."""
    # Test only with arrays of length power of 2
    test_arrays = [
        [3, 7, 4, 8, 6, 2, 1, 5],
        [8, 7, 6, 5, 4, 3, 2, 1],
        [1, 2, 3, 4, 5, 6, 7, 8],
        [2, 2, 2, 2, 2, 2, 2, 2],
        [5],  # Single element is a power of 2
        [],
    ]
    
    for arr in test_arrays:
        # Skip arrays whose length is not a power of 2
        length = len(arr)
        if length & (length - 1) != 0 and length != 0:
            continue
            
        test_arr = arr.copy()
        bitonic_sort(test_arr)
        assert test_arr == sorted(arr), f"Bitonic sort failed for {arr}"
