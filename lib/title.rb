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
	
end