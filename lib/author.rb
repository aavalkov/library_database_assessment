class Author
	attr_reader :name, :id

	def initialize(author_info)
		@name = author_info['name']
		@id = author_info['id'].to_i
	end
end