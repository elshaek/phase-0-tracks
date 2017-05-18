# RELEASE 0: Implement a Simple search
# create method with 2 parameters: array and integer
# search array parameter for the integer argument by looping through each element in array and comparing to integer
# if integer is included in array, return index of element

def search_array(arr, num)
  x = 0
  
  while x < arr.length
    if arr[x] == num
      return x
    end
    x += 1
  end

  # ALTERNATIVE SOLUTION
  # index = nil
  # arr.length.times do |x|
  #   if arr[x] == num
  #     index = x
  #   end
  # end
  # index
end

arr = [42, 89, 23, 1]
p search_array(arr, 1)




# RELEASE 1 - Calculate Fibonacci Numbers
# create method with 1 parameter (x) that is the length of fibonacci array requested
# iterate through x times
# elements in index 0 and 1 of array will always be 0 and 1 respectively
# subsequent elements will acquire its value by adding the previous two numbers in the array

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
  fib_arr
end

p fib(100)
# driver code to verify if method works
puts "Last number in fib(100) is equals 218922995834555169026: #{fib(100)[-1] == 218922995834555169026}"



# RELEASE 2 - Sort an array
# create method that takes an array argument
# and sort array elements in descending order
# 1. loop through each element in the array, comparing current element with the next element (2 numbers at a time)
# 2. IF current number is smaller than the next number, then swap
# keep repeating 1. and 2. until the numbers are in descending order
    # to make sure that everything is in descending order, all comparisons must evaluate to false
    # if comparing any 2 numbers evaluate to true, repeat process

def sort_desc(arr)
  
  # loop do
  #   swapped = false
  # 
  #   (arr.length-1).times do |x|
  #     if arr[x] < arr[x+1]
  #         arr[x], arr[x+1] = arr[x+1], arr[x]
  #         swapped = true
  #     end
  #   end
  #   
  #   if swapped == false
  #     break
  #   end
  # 
  # end

  #ALTERNATIVE SOLUTION
  condition = true

  while condition == true
    condition = false             # reset condition to false after every loop of the array

    (arr.length-1).times do |x|   # arr.length-1 because we cannot compare the last element in the array
      if arr[x] < arr[x+1]
        arr[x], arr[x+1] = arr[x+1], arr[x]
        condition = true          # if at any point in the iteration condition = true, it cannot be changed to false for the current while loop
      end
    end
  end
  p arr
end

arr1 = [1,5,4,2,10]
arr2 = [100,3,50,23,65,75,85]

sort_desc(arr1)
sort_desc(arr2)