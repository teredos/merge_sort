# frozen_string_literal: true

def merge_sort(arr)
  return arr if arr.length <= 1

  left_arr = merge_sort(arr[0..(arr.length / 2) - 1])
  right_arr = merge_sort(arr[arr.length / 2..])
  merge_sides(left_arr, right_arr)
end

def merge_sides(left, right, new_arr = [])
  (left + right).length.times do
    break if left.empty? && right.empty?

    if left.empty? || right.empty?
      new_arr += non_empty_arr(left, right)
      break
    else
      add_lowest_int(left, right, new_arr)
    end
  end
  new_arr
end

def non_empty_arr(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  end
end

def add_lowest_int(left, right, new_arr)
  if left[0] <= right[0]
    new_arr << left.shift
  elsif right[0] < left[0]
    new_arr << right.shift
  end
end

random_array = Array.new(15) { rand(100) }

puts "Unsorted Array: #{random_array}"
puts "Sorted Array: #{merge_sort(random_array)}"
