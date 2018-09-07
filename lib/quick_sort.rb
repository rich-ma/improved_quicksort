class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    pivot = array.shift
    left = []
    right = []
    array.each { |el| el < pivot ? left << el : right << el }
    QuickSort.sort1(left) + [pivot] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= proc { |x, y| x <=> y }
    return array if length <= 1

    pivot = array[0]
    
    
  end

  def self.partition(array, start, length, &prc)
    prc ||= proc { |x, y| x <=> y }

  end
end
