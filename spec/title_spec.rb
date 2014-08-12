require 'spec_helper'

describe 'title' do
	describe 'initialize' do
		it 'intializes with a name' do
			new_title = Title.new({"name" => "Yertle the Turtle"})
			expect(new_title).to be_an_instance_of (Title)
		end
	end	
end