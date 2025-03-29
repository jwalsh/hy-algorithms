(defn bucket-sort [array]
  "Sort uniformly distributed array using bucket sort.
  
  Parameters:
    array: List of values to sort (typically floating point values in [0,1])
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: Average O(n) time where n is array length
  Space Complexity: O(n)
  Constraint: Performance depends on distribution - optimal for uniform distribution"
  
  (let [n (len array)
        buckets (lfor _ (range n) [])
        min-val (min array)
        max-val (max array)
        value-range (+ (- max-val min-val) 0.001)]  ; Add small epsilon to avoid division by zero
    
    ;; Distribute elements into buckets
    (for [num array]
      (let [bucket-idx (min (int (* n (/ (- num min-val) value-range))) (- n 1))]
        (.append (get buckets bucket-idx) num)))
    
    ;; Sort individual buckets using insertion sort
    (for [i (range n)]
      (setv (get buckets i) (sorted (get buckets i))))  ; Using Python's built-in sort for simplicity
    
    ;; Concatenate buckets back into original array
    (let [idx 0]
      (for [bucket buckets]
        (for [num bucket]
          (setv (get array idx) num)
          (setv idx (+ idx 1)))))
    
    array))

;; Usage example:
#_(defmain [&rest args]
  (let [arr [0.42, 0.32, 0.33, 0.52, 0.37, 0.47, 0.51]]
    (print "Original array:" arr)
    (bucket-sort arr)
    (print "Sorted array:" arr)))
