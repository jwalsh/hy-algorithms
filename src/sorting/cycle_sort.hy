(defn cycle-sort [array]
  "Sort an array using cycle sort algorithm with minimal memory writes.
  
  Parameters:
    array: List to sort
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: O(n²) worst case, where n is array length
  Space Complexity: O(1)
  Constraints: Optimal for arrays with values in range [1...n]
  Advantage: Minimal memory writes"
  
  (for [cycle-start (range (- (len array) 1))]
    (let [item (get array cycle-start)]
      
      ;; Find position where item belongs
      (setv pos cycle-start)
      (for [i (range (+ cycle-start 1) (len array))]
        (when (< (get array i) item)
          (setv pos (+ pos 1))))
      
      ;; If item already in correct position
      (when (= pos cycle-start)
        (continue))
        
      ;; Otherwise, put item in correct position
      (while (= item (get array pos))
        (setv pos (+ pos 1)))
      
      (let [temp (get array pos)]
        (setv (get array pos) item)
        (setv item temp))
      
      ;; Rotate rest of the cycle
      (while (!= pos cycle-start)
        (setv pos cycle-start)
        
        (for [i (range (+ cycle-start 1) (len array))]
          (when (< (get array i) item)
            (setv pos (+ pos 1))))
            
        (while (= item (get array pos))
          (setv pos (+ pos 1)))
          
        (let [temp (get array pos)]
          (setv (get array pos) item)
          (setv item temp)))))
          
  array)

;; Usage example:
#_(defmain [&rest args]
  (let [arr [5 4 3 2 1]]
    (print "Original array:" arr)
    (cycle-sort arr)
    (print "Sorted array:" arr)))
