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
	puts "Press 8 to add a publisher to a title"
	puts "Press 9 to add an author to a title"
	puts "Press 10 to exit"
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
	elsif choice == 6
		view_publishers
		main_menu
	elsif choice == 7
		search
		main_menu
	elsif choice == 8
		add_publisher_to_title
		main_menu
	elsif choice == 9
		add_author_to_title
		main_menu
	elsif choice == 10
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

def add_author_to_title
	view_titles
	puts "Enter number of the title"
	title_number = gets.chomp.to_i
	view_authors
	puts "Enter the number of the author"
	author_number = gets.chomp.to_i
	title = Title.all[title_number - 1]
	author = Author.all[author_number -1]
	title.add_author(author)
end


def add_publisher
	puts "Enter the name of the publisher:"
	publisher = gets.chomp
	new_publisher = Publisher.new("name" => publisher)
	new_publisher.save
	puts "Publisher added!"
end

def add_publisher_to_title
	puts "Add a publisher to a book title. Enter the number of the publisher:"
	view_publishers
	publisher_choice = gets.chomp.to_i
	publisher = Publisher.all[publisher_choice-1]
	view_titles
	puts "Enter the book number"
	title_choice = gets.chomp.to_i
	Title.all[title_choice - 1].add_publisher(publisher)
end

def view_publishers
	puts "All book publishers:"
	Publisher.all.each_with_index do |publisher, index|
		puts (index +1).to_s + ". " + publisher.name
	end
end

def search
	puts "Press 1 to search publishers for their book titles"
	puts "Press 2 to search book titles for a publisher"
	puts "Press 3 to search authors for all of their books"
	puts "Press 4 to search books for their author or authors"
	user_choice = gets.chomp.to_i
	if user_choice == 1
		search_publishers
	elsif user_choice == 2
		search_titles_for_publisher
	elsif user_choice == 3
		search_authors_for_titles
	elsif user_choice == 4
		search_titles_for_authors
	end
end

def search_titles_for_authors
	view_titles
	puts "Enter the number of the title"
	title_number = gets.chomp.to_i
	new_title = Title.all[title_number -1]
	results = new_title.view_authors_by_title 
	results.each do |result|
		puts result.name
	end
end

# def search_publishers
# 	view_publishers
# 	puts "Enter the number of the publisher"
# 	pubisher_number = gets.chomp.to_i
# 	specific_publisher = Publisher.all[publisher_number - 1]
# 	Title.show_publisher(specific_publisher)
# end

main_menu
			
			
			
	

