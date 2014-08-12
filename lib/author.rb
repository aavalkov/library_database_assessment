class Author
	attr_reader :name, :id

	def initialize(author_info)
		@name = author_info["name"]
		@id = author_info["id"].to_i
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

  def save
		result = DB.exec("INSERT INTO author (name) VALUES ('#{name}') RETURNING id;")
		@id = result.first['id'].to_i
	end

	def view_titles_by_author
    titles = []
    results = DB.exec("SELECT title.* FROM author join books on (author.id = books.author_id) join title on (books.title_id = title.id) where author.id =#{self.id};")
    results.each do |result|
      new_title = Title.new(result)
      titles << new_title
    end
    titles
  end

	def ==(author_two)
		self.name == author_two.name
	end
end