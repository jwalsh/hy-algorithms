(defn get-digit [num digit]
  "Get the digit at specified position in a number"
  (// (% num (** 10 (+ digit 1))) (** 10 digit)))

(defn counting-sort-by-digit [array digit]
  "Sort by specific digit position using counting sort"
  (let [output (lfor _ (range (len array)) 0)
        counts (lfor _ (range 10) 0)]
    
    ;; Count occurrences of each digit
    (for [num array]
      (let [digit-value (get-digit num digit)]
        (setv (get counts digit-value) (+ (get counts digit-value) 1))))
    
    ;; Calculate cumulative counts
    (for [i (range 1 10)]
      (setv (get counts i) (+ (get counts i) (get counts (- i 1)))))
    
    ;; Build output array
    (for [i (range (- (len array) 1) -1 -1)]
      (let [num (get array i)
            digit-value (get-digit num digit)
            pos (- (get counts digit-value) 1)]
        (setv (get output pos) num)
        (setv (get counts digit-value) (- (get counts digit-value) 1))))
    
    ;; Copy back to original array
    (for [i (range (len array))]
      (setv (get array i) (get output i))))
  
  array)

(defn radix-sort [array max-digits]
  "Sort an array of non-negative integers using radix sort.
  
  Parameters:
    array: List of non-negative integers to sort
    max-digits: The maximum number of digits in any number in the array
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: O(d*(n+k)) where n is array length, d is max-digits, and k is radix (10)
  Space Complexity: O(n+k)
  Constraint: Optimal for multi-digit numbers"
  
  (for [digit (range max-digits)]
    (counting-sort-by-digit array digit))
  array)

;; Usage example:
#_(defmain [&rest args]
  (let [arr [170, 45, 75, 90, 802, 24, 2, 66]]
    (print "Original array:" arr)
    (radix-sort arr 3)  ; 3 digits in the largest number (802)
    (print "Sorted array:" arr)))
