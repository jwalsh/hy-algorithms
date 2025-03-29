(import src.sorting.counting-sort)
(import src.sorting.dutch-national-flag)
(import src.sorting.cycle-sort)
(import src.sorting.radix-sort)
(import src.sorting.bucket-sort)
(import src.sorting.bitonic-sort)

(defn print-separator []
  (print "-" * 50))

(defn run-counting-sort []
  (print "Counting Sort Example:")
  (let [arr [4 2 2 8 3 3 1]]
    (print "Original array:" arr)
    (src.sorting.counting-sort.counting-sort arr 8)
    (print "Sorted array:" arr))
  (print-separator))

(defn run-dutch-national-flag []
  (print "Dutch National Flag Example:")
  (let [arr [2 0 1 2 1 0 2 1 0]]
    (print "Original array:" arr)
    (src.sorting.dutch-national-flag.dutch-national-flag arr)
    (print "Sorted array:" arr))
  (print-separator))

(defn run-cycle-sort []
  (print "Cycle Sort Example:")
  (let [arr [5 4 3 2 1]]
    (print "Original array:" arr)
    (src.sorting.cycle-sort.cycle-sort arr)
    (print "Sorted array:" arr))
  (print-separator))

(defn run-radix-sort []
  (print "Radix Sort Example:")
  (let [arr [170 45 75 90 802 24 2 66]]
    (print "Original array:" arr)
    (src.sorting.radix-sort.radix-sort arr 3)  ; 3 digits in the largest number (802)
    (print "Sorted array:" arr))
  (print-separator))

(defn run-bucket-sort []
  (print "Bucket Sort Example:")
  (let [arr [0.42 0.32 0.33 0.52 0.37 0.47 0.51]]
    (print "Original array:" arr)
    (src.sorting.bucket-sort.bucket-sort arr)
    (print "Sorted array:" arr))
  (print-separator))

(defn run-bitonic-sort []
  (print "Bitonic Sort Example:")
  (let [arr [3 7 4 8 6 2 1 5]]  ; Must be a power of 2 in length
    (print "Original array:" arr)
    (src.sorting.bitonic-sort.sort-array arr)
    (print "Sorted array:" arr))
  (print-separator))

(defmain [&rest args]
  (print "Hy Algorithms - Sorting Demonstrations")
  (print "======================================")
  (print)
  
  (run-counting-sort)
  (run-dutch-national-flag)
  (run-cycle-sort)
  (run-radix-sort)
  (run-bucket-sort)
  (run-bitonic-sort)
  
  (print "All sorting demonstrations completed!"))