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


end