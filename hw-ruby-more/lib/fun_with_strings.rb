module FunWithStrings
	def palindrome?
		temp = self.downcase.gsub(/[^a-z]/, '')
		if (temp.reverse == temp)		#Palindromes are the name forwards and backwards; just reverse and compare
			return true
		else
			return false
		end
	end
	def count_words
		wordcount = Hash.new(0)
		self.downcase.gsub(/[,.!-]/, '').split.each {|word| wordcount[word] = wordcount[word] + 1}	#Search for punctuation or spaces then split the string up using those
		return wordcount
	end
	def anagram_groups
		return self.downcase.split.group_by {|character| character.chars.sort}.values		#Scrambles characters and groups by similarity
	end
end
class String
	include FunWithStrings
end
