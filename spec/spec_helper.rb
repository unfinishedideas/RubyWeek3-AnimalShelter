require 'rspec'
require 'pg'
require 'animal'
require 'customer'
require 'pry'

DB = PG.connect({:dbname => 'shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("DELETE FROM customers *;")
  end
end
