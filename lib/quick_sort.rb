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
    # pivot = array[0]
    pivot = QuickSort.partition(array, start, length, &prc)

    
  end

  def self.partition(array, start, length, &prc)
    prc ||= proc { |x, y| x <=> y }
    pivot = arr[start]
    left = start + 1
    
    1.upto(length - 1) do |i|
      if prc.call(pivot, arr[start + i]) == 1
        arr[start + i], arr[left] = arr[left], arr[start + i]
        left += 1
      end
    end
    # swapping pivot and last 'left' item
    arr[start], arr[left - 1] = arr[left - 1], arr[start]
    left - 1
  end

end
