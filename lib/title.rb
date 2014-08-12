class Title
	
	attr_reader :name, :id

	def initialize(title_info)
		@name = title_info['name']
		@id = title_info['id'].to_i
	end
end