# Counting Sort

Counting Sort is a non-comparison-based sorting algorithm that works by determining the number of elements that should come before each element in the final sorted array.

## Overview

Counting sort operates by counting the number of objects with distinct key values, then using arithmetic to determine the positions of each key in the output sequence. It's particularly efficient when the range of values is small relative to the number of elements.

## Time and Space Complexity

- **Time Complexity**: O(n + k) where n is the number of elements and k is the range of input
- **Space Complexity**: O(k) for the counting array
- **In-Place**: No
- **Stable**: Yes

## Algorithm

1. Find the maximum value in the array
2. Create a counting array of size max+1 initialized with zeros
3. Count occurrences of each element in the input array
4. Update the counting array such that each element stores the number of elements less than or equal to it
5. Iterate through the input array in reverse order, place each element at its correct position in the output array, and decrease its count by 1

## When to Use

- When the range of values is not significantly larger than the number of elements
- When the data is in a small range, e.g., ages of people, grades, etc.
- When stability is required (preserving the relative order of equal elements)

## Hy Implementation

```lisp
(defn