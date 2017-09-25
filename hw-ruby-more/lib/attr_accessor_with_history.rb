class Class
#checks if attribute has a history; if no, it creates one
#appends most recent instance to history array
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name + "_history"
	class_eval %Q{
		def #{attr_name}=(value)
			if (!defined?(@#{attr_name}_history) == true)
				@#{attr_name}_history = Array.new
			end
			@#{attr_name}_history << @#{attr_name}
			@#{attr_name} = value
		end}
	end
end
