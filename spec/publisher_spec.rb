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
  
end