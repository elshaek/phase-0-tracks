
# RELEASE 0: Implement a Simple search

# create method with 2 parameters: array and integer
def search_array(arr, num)
  # search array parameter for the integer argument
  x = 0

  # loop through each element in array and compare to integer
  while x < arr.length
    # if integer is included in array, return index of element
    if arr[x] == num
      return x
    end
    x += 1
  end

end


arr = [42, 89, 23, 1]
p search_array(arr,24)


# RELEASE 1 - Calculate Fibonacci Numbers


# create method with 1 parameter (x) that is the length of fibonacci array
def fib(num)
# create fibonacci array
fib_arr = []

# iterate through x times
  num.times do |x|

    # IF index is 0, enter 0 into array
    if x == 0
      fib_arr << 0
    # IF index is 1, enter 1 into array
    elsif x == 1
      fib_arr << 1
    # ELSE add last 2 previous numbers in the array
    else
      fib_arr << fib_arr[x-1] + fib_arr[x-2]
    end

  end
p fib_arr
end

fib(100)


# RELEASE 2 - Sort an array
# create method that takes an array arg
def sort_desc(arr)
  # sort array elements in descending order

  loop do
    swapped = false

    # loop through each element in the array, comparing current number with the next element
    (arr.length-1).times do |x|
      # IF current number is smaller than the next number, then swap
      if arr[x] < arr[x+1]
          arr[x], arr[x+1] = arr[x+1], arr[x]
          swapped = true
      end

      end

      if swapped == false
        break
      end

  end
p arr
end
arr = [1,5,4,2,10]
sort_desc(arr)