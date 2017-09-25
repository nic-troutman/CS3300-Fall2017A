# When done, submit this entire file to the autograder.

# Part 1

def sum(arr)
	i = 0
	temp = 0
	if arr.size() != 0
		while i < arr.size()
			temp += arr[i]
			i += 1
		end
	end
	return temp
end

def max_2_sum(arr)
	temp = [0,0]
	large1 = 0
	large2 = 0
	if arr.size() == 0
		#Fall through
	elsif arr.size() == 1
		large1 = arr[0]
	else
		temp = arr.max(2)
		large1 = temp[0]
		large2 = temp[1]
	end
	return large1 + large2
end

def sum_to_n? arr, n
	if arr.size() == 0
		return false
	elsif arr.empty? && n == 0
		return true
	else
		return arr.combination(2).any? {|a, b| a + b == n } #returns true if any combo works
	end
end

# Part 2

def hello(name)
	return "Hello, " + name
end

def starts_with_consonant? (s)
	return s =~ /\A(?=[^aeiou])(?=[a-z])/i	#Anchored to the front; we just need to know what it starts with
end

def binary_multiple_of_4? (s)
	return (s.to_s =~ /\b[01]+\b/ && s.to_i % 4 == 0)
end

# Part 3

class BookInStock
	def initialize isbn, price
		if isbn.empty? || isbn == ""
			raise ArgumentError.new("Invalid ISBN")
		elsif price <= 0
			raise ArgumentError.new("Invalid price")
		end
	@isbn = isbn
	@price = price
	end

	def price_as_string
		format("$%.2f", @price)
	end

	attr_accessor :isbn, :price
end
