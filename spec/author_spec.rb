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
	
	describe "==" do
  	it "makes two objects equal to one another if they have the same author" do
  		new_author = Author.new({"name" => "Dr.Suess"})
  		new_author_two = Author.new({"name" => "Dr.Suess"})
  		expect(new_author).to eq new_author_two
  	end
  end

end


