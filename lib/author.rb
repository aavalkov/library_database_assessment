class Author
	attr_reader :name, :id

	def initialize(author_info)
		@name = author_info['name']
		@id = author_info['id'].to_i
	end

	def self.all
		authors = []
    results = DB.exec("SELECT * FROM author;")
    results.each do |result|
      new_author = Author.new(result)
      authors << new_author
    end
    authors
  end
end