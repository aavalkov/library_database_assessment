require 'spec_helper'

describe 'title' do
	describe 'initialize' do
		it 'intializes with a name' do
			new_title = Title.new({"name" => "Yertle the Turtle"})
			expect(new_title).to be_an_instance_of (Title)
		end
	end	

	describe 'self.all' do
    it 'pulls all titles out of the DB and saves them as objects' do
      expect(Title.all).to eq []
    end
  end

  describe 'save' do
  	it "saves titles into the database" do
  		new_title = Title.new({"name" => "Yertle the Turtle"})
  		new_title.save
  		expect(Title.all).to eq [new_title]
  	end
  end

  describe "==" do
  	it "makes two objects equal to one another if they have the same title" do
  		new_title = Title.new({"name" => "Yertle the Turtle"})
  		new_title_two = Title.new({"name" => "Yertle the Turtle"})
  		expect(new_title).to eq new_title_two
  	end
  end

  describe "add_author" do
  	it "adds an author to a title" do
  		new_title = Title.new({"name" => "Yertle the Turtle"})
  		new_title.save
  		new_author = Author.new({"name" => "Dr.Suess"})
  		new_author.save
  		new_title.add_author(new_author)
  		results = DB.exec("SELECT * FROM books WHERE title_id = #{new_title.id}")
  		expect(results.first['author_id'].to_i).to eq new_author.id
  	end
  end

  describe "view_authors_by_title" do
  	it "lists all authors on one title" do
  		new_title = Title.new({"name" => "Chicka Chicka Boom Boom"})
  		new_title.save
  		new_author = Author.new({"name" => "Bill Martin"})
  		new_author.save
  		new_author_two = Author.new({"name" => "John Archambault"})
  		new_author_two.save
  		new_author_three = Author.new({"name" => "Dr.Suess"})
  		new_author_three.save
  		new_title.add_author(new_author)
  		new_title.add_author(new_author_two)
  		expect(new_title.view_authors_by_title).to eq [new_author, new_author_two]
  	end
  end
end