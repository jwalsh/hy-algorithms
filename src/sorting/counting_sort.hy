(defn counting-sort [array max-value]
  "Sort an array of non-negative integers in a single pass using counting sort.
  
  Parameters:
    array: List of non-negative integers to sort
    max-value: The maximum value in the array
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: O(n+k) where n is array length and k is max-value
  Space Complexity: O(k)
  Constraints: Only works for non-negative integers in a known range [0,k]"
  
  (let [counts (lfor i (range (+ max-value 1)) 0)]
    
    ;; Count occurrences
    (for [num array]
      (setv (get counts num) (+ (get counts num) 1)))
    
    ;; Overwrite original array with sorted values
    (let [idx 0]
      (for [i (range (+ max-value 1))]
        (while (> (get counts i) 0)
          (setv (get array idx) i)
          (setv idx (+ idx 1))
          (setv (get counts i) (- (get counts i) 1)))))
    
    array))

;; Usage example:
#_(defmain [&rest args]
  (let [arr [4 2 2 8 3 3 1]]
    (print "Original array:" arr)
    (counting-sort arr 8)
    (print "Sorted array:" arr)))
