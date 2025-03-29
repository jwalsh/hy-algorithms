(defn swap [array i j]
  "Swap elements at indices i and j in array"
  (let [temp (get array i)]
    (setv (get array i) (get array j))
    (setv (get array j) temp)))

(defn dutch-national-flag [array]
  "Sort an array containing only 0s, 1s, and 2s in a single pass.
  
  Parameters:
    array: List containing only three distinct values (typically 0, 1, 2)
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: O(n) where n is array length
  Space Complexity: O(1)
  Constraints: Works only with three distinct values"
  
  (let [low 0
        mid 0
        high (- (len array) 1)]
    
    (while (<= mid high)
      (cond [(= (get array mid) 0)
             (swap array low mid)
             (setv low (+ low 1))
             (setv mid (+ mid 1))]
            
            [(= (get array mid) 1)
             (setv mid (+ mid 1))]
            
            [True  ; (= (get array mid) 2)
             (swap array mid high)
             (setv high (- high 1))]))
    
    array))

;; Usage example:
#_(defmain [&rest args]
  (let [arr [2 0 1 2 1 0 2 1 0]]
    (print "Original array:" arr)
    (dutch-national-flag arr)
    (print "Sorted array:" arr)))
