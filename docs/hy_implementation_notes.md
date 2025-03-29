# Hy Implementation Notes

This document provides some key notes and considerations for implementing algorithms in Hy 1.0.

## Hy 1.0 Specifics

### Import Semantics

In Hy 1.0, import statements work differently than in earlier versions. The preferred way to import modules is:

```lisp
(import module.name)
```

Then, to access functions from that module:

```lisp
(module.name.function-name arg1 arg2)
```

This is different from the earlier bracket-style imports like:

```lisp
;; This style won't work in Hy 1.0
(import [module.name [function-name]])
```

### List Comprehensions

In Hy 1.0, list comprehensions use the `lfor` macro:

```lisp
;; Create a list of zeros of length n
(lfor i (range n) 0)
```

### Variable Assignment

Use `setv` for variable assignment:

```lisp
(setv my-var 10)
```

### Conditionals

Hy 1.0 uses `cond` for multiple condition checking instead of nested `if` statements:

```lisp
(cond [(= x 0) (print "x is zero")]
      [(< x 0) (print "x is negative")]
      [True (print "x is positive")])
```

### Loop Constructs

Hy 1.0 provides various looping constructs:

```lisp
;; For loop
(for [item collection]
  (do-something item))
  
;; While loop
(while condition
  (do-something))
```

### Function Definition

Functions are defined with `defn`:

```lisp
(defn my-function [param1 param2]
  "Docstring for my function"
  (body))
```

### Main Entry Point

For creating executable scripts, use `defmain`:

```lisp
(defmain [&rest args]
  (print "Hello World"))
```

## Data Structures

### Working with Lists

In Hy, lists are implemented as Python lists, which means they have O(n) access time for arbitrary indices.

```lisp
;; Access element
(get my-list index)

;; Set element
(setv (get my-list index) new-value)

;; Append to list
(.append my-list new-item)
```

### Working with Dictionaries

Dictionaries in Hy map to Python dictionaries:

```lisp
;; Create a dictionary
(setv my-dict {})

;; Set key-value pair
(setv (get my-dict "key") "value")

;; Get value
(get my-dict "key")
```

## Testing

When writing tests for Hy code, it's often easiest to use Python's pytest framework:

```python
# Import your Hy modules
import hy
import src.your_module

# Write test functions
def test_function():
    result = src.your_module.your_function(args)
    assert result == expected
```

## Common Pitfalls

1. **Name Collisions**: Avoid using names that clash with Python or Hy built-ins.
2. **Recursion Limits**: Be aware of Python's recursion limits when implementing recursive algorithms.
3. **Performance**: For performance-critical code, consider the overhead of function calls in Hy.
4. **Immutability**: Remember that strings and tuples are immutable in Python (and therefore in Hy).
5. **Error Handling**: Use `try`/`except` blocks for robust error handling.

## Org-mode and Babel Integration

To use these algorithms with org-mode and Babel:

```org
#+BEGIN_SRC hy :tangle yes :mkdirp t
(import src.sorting.counting-sort)
(src.sorting.counting-sort.counting-sort [4 2 2 8 3 3 1] 8)
#+END_SRC
```

For creating literate programs with algorithms:

```org
* Counting Sort
#+PROPERTY: header-args:hy :mkdirp t :tangle src/sorting/counting_sort.hy

** Function Definition
#+BEGIN_SRC hy
(defn counting-sort [array max-value]
  "Sort an array of non-negative integers in a single pass using counting sort."
  ;; implementation here
  )
#+END_SRC

** Usage Example
#+BEGIN_SRC hy :tangle examples/counting_sort_example.hy
(import src.sorting.counting-sort)
(let [arr [4 2 2 8 3 3 1]]
  (print "Original array:" arr)
  (src.sorting.counting-sort.counting-sort arr 8)
  (print "Sorted array:" arr))
#+END_SRC
```

## Using Mermaid for Algorithm Visualization

When documenting algorithms with Mermaid in org-mode:

```org
#+BEGIN_SRC mermaid :file images/algorithm_flowchart.png
flowchart TD
    A[Input Array] --> B{Input Type?}
    B -->|Small Range Integers| C[Counting Sort]
    B -->|Three Values| D[Dutch National Flag]
    ...
#+END_SRC
```
