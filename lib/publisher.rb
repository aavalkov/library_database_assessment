class Publisher
	attr_reader :name, :id

	def initialize(publisher_info)
		@name = publisher_info["name"]
		@id = publisher_info["id"].to_i	
	end

	def self.all
		publishers = []
    results = DB.exec("SELECT * FROM publisher;")
    results.each do |result|
      new_publisher = Publisher.new(result)
      publishers << new_publisher
    end
    publishers
  end

  def save
		result = DB.exec("INSERT INTO publisher (name) VALUES ('#{name}') RETURNING id;")
		@id = result.first["id"].to_i
	end

	def ==(publisher_two)
		self.name == publisher_two.name
	end
end