require "spec_helper"

describe "Author" do

	describe "initialize" do
		it "initializes with a name" do
			new_author = Author.new("Dr.Suess")
			expect(new_author).to be_an_instance_of Author
		end
	end

	describe "self.all" do
		it 'pulls all authors out the DB and saves them as objects' do
			expect(Author.all).to eq []
		end
	end

	describe "save" do
		it 'saves new authors in the DB' do
			new_author = Author.new({"name" => "Dr.Suess"})
			new_author.save
			expect(Author.all).to eq [new_author]
		end
	end

	 describe "view_titles_by_author" do
  	it "lists all titles on one author" do
  		new_title = Title.new({"name" => "Yurtle the Turtle"})
  		new_title.save
  		new_title_two = Title.new({"name" => "The Lorax"})
  		new_title_two.save
  		new_title_three = Title.new({"name" => "Horton Hears a Who"})
  		new_title_three.save
  		new_author = Author.new({"name" => "Dr.Suess"})
  		new_author.save
  		new_title.add_author(new_author)
  		new_title_two.add_author(new_author)
  		new_title_three.add_author(new_author)
  		expect(new_author.view_titles_by_author).to eq [new_title, new_title_two, new_title_three]
  	end
  end
	
	describe "==" do
  	it "makes two objects equal to one another if they have the same author" do
  		new_author = Author.new({"name" => "Dr.Suess"})
  		new_author_two = Author.new({"name" => "Dr.Suess"})
  		expect(new_author).to eq new_author_two
  	end
  end

end


