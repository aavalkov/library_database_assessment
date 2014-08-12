require 'spec_helper'

describe 'Publisher' do
	describe 'initialize' do
		it 'intializes with a name' do
			new_publisher = Publisher.new({"name" => "Random House"})
			expect(new_publisher).to be_an_instance_of (Publisher)
		end
	end	
end