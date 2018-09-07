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

    left = QuickSort.sort2!(array, start, pivot - start, &prc)
    right = QuickSort.sort2!(array, pivot + 1, length - (pivot - start) - 1, &prc)
    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= proc { |x, y| x <=> y }
    if length > 2
      first = array[start]
      last = array[start + length - 1]
      mid = array[(start + length)/2]
      if mid <= first && mid >= last
        array[start], array[(start + length)/2] = array[(start + length)/2], array[start]
      elsif last <= first && last >= mid
        array[start], array[(start + length - 1)] = array[(start + length - 1)], array[start]
      else
      end
    end
    pivot = array[start]
    left = start
    
    1.upto(length - 1) do |i|
      if prc.call(pivot, array[start + i]) == 1
        array[start + i], array[left + 1] = array[left + 1], array[start + i]
        left += 1
      end
    end
    # swapping pivot and last 'left' item
    array[start], array[left] = array[left], array[start]
    left
  end

end
