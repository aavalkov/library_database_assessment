require 'spec_helper'

describe 'Publisher' do
	describe 'initialize' do
		it 'intializes with a name' do
			new_publisher = Publisher.new({"name" => "Random House"})
			expect(new_publisher).to be_an_instance_of (Publisher)
		end
	end	

	describe 'self.all' do
    it 'pulls all publishers out of the DB and saves them as objects' do
      expect(Publisher.all).to eq []
    end
  end

  describe 'save' do
  	it "saves publishers into the database" do
  		new_publisher = Publisher.new({"name" => "Random House"})
  		new_publisher.save
  		expect(Publisher.all).to eq [new_publisher]
  	end
  end

  describe "==" do
  	it "makes two objects equal to one another if they have the same publisher" do
  		new_publisher = Publisher.new({"name" => "Random House"})
  		new_publisher_two = Publisher.new({"name" => "Random House"})
  		expect(new_publisher).to eq new_publisher_two
  	end
  end

  describe "show_titles" do
  	it "shows all of the titles under one publisher" do
  		new_title = Title.new({"name" => "Yertle the Turtle"})
  		new_title.save
  		new_title_two = Title.new({"name" => "Wonder"})
  		new_title_two.save
  		new_publisher = Publisher.new({"name" => "Random House"})
  		new_publisher.save
  		new_title.add_publisher(new_publisher)
  		new_title_two.add_publisher(new_publisher)
  		expect(new_publisher.show_titles).to eq [new_title, new_title_two]
  	end
  end

end