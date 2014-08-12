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
end


