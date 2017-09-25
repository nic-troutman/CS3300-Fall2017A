class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	def healthy?
		return @calories < 200
	end
	def delicious?		#It's a dessert, so it is ALWAYS delicious
		return true
	end
	attr_accessor :name
	attr_accessor :calories
end

class JellyBean < Dessert
	def initialize(flavor)
		@flavor = flavor
		@name = @flavor + " jelly bean"
		@calories = 5
	end
	def delicious?
		if(@flavor.to_s == "licorice")		#Licorice is nasty, so we know it will not be delicious
			return false
		end
		return true
	end
	attr_accessor :flavor
end
