# RELEASE 0: Implement a Simple search
# create method with 2 parameters: array and integer
# search array parameter for the integer argument
# loop through each element in array and compare to integer
# if integer is included in array, return index of element

def search_array(arr, num)
  #x = 0
  #
  #while x < arr.length
  #  if arr[x] == num
  #    return x
  #  end
  #  x += 1
  #end

  index = nil
  arr.each do |x|
    if arr[x] == num
      index = x
      p index
    end
  end
  index
end

arr = [42, 89, 23, 1]
p search_array(arr, 42)




# RELEASE 1 - Calculate Fibonacci Numbers
# create method with 1 parameter (x) that is the length of fibonacci array
# create fibonacci array
# iterate through x times
# IF index is 0, enter 0 into array
# IF index is 1, enter 1 into array
# ELSE add last 2 previous numbers in the array

def fib(num)
  fib_arr = []

  num.times do |x|
    
    if x == 0
      fib_arr << 0
    elsif x == 1
      fib_arr << 1
    else
      fib_arr << fib_arr[x-1] + fib_arr[x-2]
    end

  end
p fib_arr
end

fib(100)




# RELEASE 2 - Sort an array
# create method that takes an array arg
# sort array elements in descending order
# loop through each element in the array, comparing current number with the next element
# IF current number is smaller than the next number, then swap

def sort_desc(arr)
  loop do
    swapped = false

    (arr.length-1).times do |x|
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