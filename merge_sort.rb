# method merge_sort that takes one array
# n = array.length
# base case n < 2 return
# divide original array in two array of n/2 length
# merge_sort those arrays too (recursion)
# merge the two half arrays into the original array length and return it
# set pointers, go trough the array and compare the items
# if one pointer surpass the array length stop and merge the rest of the other array

def merge(left, right, array)
  left_idx = 0
  right_idx = 0
  array_idx = 0

  until left_idx >= left.length || right_idx >= right.length
    if left[left_idx] < right[right_idx]
      array[array_idx] = left[left_idx]
      left_idx += 1
    else
      array[array_idx] = right[right_idx]
      right_idx += 1
    end
    array_idx += 1
  end
  
  if left_idx >= left.length
    until right_idx >= right.length
      array[array_idx] = right[right_idx]
      right_idx += 1
      array_idx += 1
    end
  elsif right_idx >= right.length
    until left_idx >= left.length
      array[array_idx] = left[left_idx]
      array_idx += 1
      left_idx += 1
    end
  end
  array
end

def merge_sort(array)
  n = array.length
  return if n < 2

  left, right = array.each_slice( (n/2.0).round ).to_a
  merge_sort(left)
  merge_sort(right)
  merge(left, right, array)
  array
end

a = []
rand(500).times do
  a << rand(500)
end

p merge_sort(a)


