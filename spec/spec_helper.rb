require 'rspec'
require 'pg'
require 'title'
require 'author'

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM title *;")
    DB.exec("DELETE FROM author *;")
    DB.exec("DELETE FROM books *;")
  end
end
