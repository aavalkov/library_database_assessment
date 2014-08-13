require 'pg'
require './lib/title'
require './lib/author'
require './lib/publisher'

DB = PG.connect({:dbname => 'library'})

def main_menu
	puts "Press 1 to add a title"
	puts "Press 2 view all titles"
	puts "Press 3 to add an author"
	puts "Press 4 to view all authors"
	puts "Press 5 to add a publisher"
	puts "Press 6 to view all publishers"
	puts "Press 7 to search"
	puts "Press 8 to exit"
	choice = gets.chomp.to_i
	if choice == 1
		add_title
		main_menu
	elsif choice == 2
		view_titles
		main_menu
	elsif choice == 3
		add_author
		main_menu
	elsif choice == 4
		view_authors
		main_menu
	elsif choice == 5
		add_publisher
		main_menu
	elsif choice == 6
		view_publishers
		main_menu
	elsif choice == 7
		search
		main_menu
	elsif choice == 8
		puts "Bye!"
		exit
	end
end

def add_title
	puts "Enter the book's title:"
	title = gets.chomp
	new_title = Title.new("name" => title)
	new_title.save
	puts "Title added!"
end

def view_titles
	puts "All book titles:"
	Title.all.each_with_index do |title, index|
		puts (index +1).to_s + ". " + title.name
	end
end

def add_author
	puts "Enter the name of the author"
	name = gets.chomp
	new_author = Author.new("name" => name)
	new_author.save
	puts "Author added!"
end

def view_authors
	puts "All authors:"
	Author.all.each_with_index do |author, index|
		puts (index +1).to_s + ". " + author.name
	end
end

def add_publisher
	puts "Enter the name of the publisher:"
	publisher = gets.chomp
	new_publisher = Publisher.new("name" => publisher)
	new_publisher.save
	puts "Publisher added!"
end

def view_publishers
	puts "All book publishers:"
	Publisher.all.each_with_index do |publisher, index|
		puts (index +1).to_s + ". " + publisher.name
	end
end

main_menu
			
			
			
	

