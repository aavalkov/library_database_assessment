class Publisher
	attr_reader :name, :id

	def initialize(publisher_info)
		@name = publisher_info["name"]
		@id = publisher_info["id"].to_i	
	end
end