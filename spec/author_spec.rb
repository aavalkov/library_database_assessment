require "spec_helper"

describe "Author" do
	describe "initialize" do
		it "initializes with a name" do
			new_author = Author.new("Dr.Suess")
			expect(new_author).to be_an_instance_of Author
		end
	end
end


