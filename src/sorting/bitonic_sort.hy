(defn compare-and-swap [array i j direction]
  "Compare and swap elements based on direction"
  (when (= direction (< (get array i) (get array j)))
    (let [temp (get array i)]
      (setv (get array i) (get array j))
      (setv (get array j) temp))))

(defn bitonic-merge [array low count direction]
  "Merge a bitonic sequence"
  (when (> count 1)
    (let [k (// count 2)]
      (for [i (range low (+ low k))]
        (compare-and-swap array i (+ i k) direction))
      (bitonic-merge array low k direction)
      (bitonic-merge array (+ low k) k direction))))

(defn bitonic-sort [array low count direction]
  "Sort a bitonic sequence"
  (when (> count 1)
    (let [k (// count 2)]
      (bitonic-sort array low k True)
      (bitonic-sort array (+ low k) k False)
      (bitonic-merge array low count direction))))

(defn sort-array [array]
  "Sort array using bitonic sort.
  
  Parameters:
    array: List to sort (length must be a power of 2)
    
  Returns:
    Sorted array (sorted in-place)
    
  Time Complexity: O(log²n) parallel steps where n is array length
  Space Complexity: O(1)
  Constraints: Array length must be a power of 2
  Advantage: Highly parallelizable, efficient on parallel architectures"
  
  (bitonic-sort array 0 (len array) True)
  array)

;; Usage example:
#_(defmain [&rest args]
  (let [arr [3, 7, 4, 8, 6, 2, 1, 5]]  ; Must be a power of 2 in length
    (print "Original array:" arr)
    (sort-array arr)
    (print "Sorted array:" arr)))
