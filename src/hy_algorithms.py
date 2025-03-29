"""
Hy Algorithms - Python Interface

This module provides a Python interface to all the Hy algorithms in this library.
"""

import hy

# Import all sorting algorithms
import src.sorting.counting_sort
import src.sorting.dutch_national_flag
import src.sorting.cycle_sort
import src.sorting.radix_sort
import src.sorting.bucket_sort
import src.sorting.bitonic_sort

# Create shortcuts for easier access
counting_sort = src.sorting.counting_sort.counting_sort
dutch_national_flag = src.sorting.dutch_national_flag.dutch_national_flag
cycle_sort = src.sorting.cycle_sort.cycle_sort
radix_sort = src.sorting.radix_sort.radix_sort
get_digit = src.sorting.radix_sort.get_digit
counting_sort_by_digit = src.sorting.radix_sort.counting_sort_by_digit
bucket_sort = src.sorting.bucket_sort.bucket_sort
bitonic_sort = src.sorting.bitonic_sort.sort_array
compare_and_swap = src.sorting.bitonic_sort.compare_and_swap
bitonic_merge = src.sorting.bitonic_sort.bitonic_merge
bitonic_sort_impl = src.sorting.bitonic_sort.bitonic_sort

# Convenience functions

def sort(array, algorithm='auto', **kwargs):
    """
    Sort an array using the specified algorithm.
    
    Parameters:
        array: The array to sort
        algorithm: The algorithm to use ('auto', 'counting', 'dutch', 'cycle', 'radix', 'bucket', 'bitonic')
        **kwargs: Additional arguments for specific algorithms
    
    Returns:
        The sorted array (sorted in-place)
    """
    if algorithm == 'auto':
        # Choose algorithm based on array characteristics
        if not array:
            return array
            
        # Check if all elements are 0, 1, 2
        if all(x in [0, 1, 2] for x in array):
            return dutch_national_flag(array)
            
        # Check if array length is power of 2
        length = len(array)
        is_power_of_2 = length & (length - 1) == 0 and length != 0
        
        # Check if small range of integers
        all_ints = all(isinstance(x, int) for x in array)
        if all_ints:
            max_val = max(array) if array else 0
            range_size = max_val - min(array) if array else 0
            
            if range_size <= 1000:
                return counting_sort(array, max_val)
            elif range_size <= 1000000:
                max_digits = len(str(max_val))
                return radix_sort(array, max_digits)
                
        # Check if floating point values (likely uniform)
        all_floats = all(isinstance(x, float) for x in array)
        if all_floats:
            return bucket_sort(array)
            
        # Check if array can use bitonic sort
        if is_power_of_2 and length > 0:
            return bitonic_sort(array)
            
        # Default to cycle sort
        return cycle_sort(array)
    
    # Use the specified algorithm
    if algorithm == 'counting':
        max_val = kwargs.get('max_val', max(array) if array else 0)
        return counting_sort(array, max_val)
    elif algorithm == 'dutch':
        return dutch_national_flag(array)
    elif algorithm == 'cycle':
        return cycle_sort(array)
    elif algorithm == 'radix':
        max_digits = kwargs.get('max_digits', len(str(max(array))) if array else 0)
        return radix_sort(array, max_digits)
    elif algorithm == 'bucket':
        return bucket_sort(array)
    elif algorithm == 'bitonic':
        return bitonic_sort(array)
    else:
        raise ValueError(f"Unknown sorting algorithm: {algorithm}")
