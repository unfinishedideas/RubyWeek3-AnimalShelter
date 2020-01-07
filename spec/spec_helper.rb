require 'rspec'
require 'pg'
require 'animal'
require 'customer'
require 'pry'

DB = PG.connect({:dbname => 'shelter_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM animals *;")
    DB.exec("ALTER SEQUENCE animals_id_seq RESTART WITH 1;")
    DB.exec("DELETE FROM customers *;")
    DB.exec("ALTER SEQUENCE customers_id_seq RESTART WITH 1;")
  end
end
