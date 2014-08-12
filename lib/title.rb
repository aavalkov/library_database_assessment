class Title
	attr_reader :name, :id

	def initialize(title_info)
		@name = title_info['name']
		@id = title_info['id'].to_i
	end

	def self.all
		titles = []
		results = DB.exec("SELECT * FROM title;")
		results.each do |result|
			new_title = Title.new(result)
			titles << new_title
		end
		titles
	end

	def save
		result = DB.exec("INSERT INTO title (name) VALUES ('#{name}') RETURNING id;")
		@id = result.first['id'].to_i
	end

	def add_author(author)
		DB.exec("INSERT INTO books (title_id, author_id) VALUES (#{self.id}, #{author.id});")
	end

	def view_authors_by_title 
    authors = []
    results = DB.exec("SELECT author.* FROM title join books on (title.id = books.title_id) join author on (books.author_id = author.id) where title.id =#{self.id};")
    results.each do |result|
      new_author = Author.new(result)
      authors << new_author
    end
    authors
  end
	
	def ==(title_two)
		self.name == title_two.name
	end
end