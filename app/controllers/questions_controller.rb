class QuestionsController < ApplicationController

	# Write a program that prints the numbers from 1 to 100.  
	# But for multiples of three print “Fizz” instead of the number 
	# and for the multiples of five print “Buzz”.  
	# For numbers which are multiples of both three and five print “FizzBuzz”.
	def one
		i = 1
		@array = Array.new 
		while i < 101 do
			if (i%3 == 0) && (i%5 == 0)
				puts "FizzBuzz"
				@array << "FizzBuzz"
			elsif i % 3 == 0
				puts "Fizz"
				@array << "Fizz"
			elsif i % 5 == 0 
				puts "Buzz"
				@array << "Buzz"
			else
				puts i
				@array << i
			end
			i = i + 1			
		end
	end

	# Write a function that sorts the keys in a hash by the length of the key, as a string.  
	# E.g. { abc: ‘hello’, ‘another_key’ => 123, 4567 => ‘third’ } 
	# Returns  [“abc”, “4567”, “another_key”]
	def two
		hash = params[:Hash]
		if !hash.nil? 
			hash = eval(hash) # Quick and dirty eval way
			@array = hash.keys.map(&:to_s).sort_by(&:length)
		end
	end

	private 


end
