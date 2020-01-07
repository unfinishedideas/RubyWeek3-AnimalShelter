require 'rspec'
require 'customer'
require('spec_helper')

describe '#Customer' do

  describe('.all') do
    it("returns an empty array when there are no customers") do
      expect(Customer.all).to(eq([]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no customers") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer2 = Customer.new({:name => "Jenny Jim",  :id => nil, :phone => '666-666-6666', :preference => 'Cats', :breed => 'Macaroni Cats'})
      customer.save()
      customer2.save()
      expect(Customer.all).to(eq([customer, customer2]))
    end
  end

  describe('.all_by_breed') do
    it("returns an empty array when there are no customers") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer2 = Customer.new({:name => "Jenny Jim",  :id => nil, :phone => '666-666-6666', :preference => 'Cats', :breed => 'Macaroni Cats'})
      customer.save()
      customer2.save()
      expect(Customer.all_by_breed).to(eq([customer2, customer]))
    end
  end

  describe('#save') do
    it("saves a new customer to the database") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer.save()
      expect(Customer.all).to(eq([customer]))
    end
  end

  describe('#==') do
    it("is the same customer if it has the same attributes as another customer") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer2 = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      expect(customer).to(eq(customer2))
    end
  end

  describe('.clear') do
    it("should clear the database of entries") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer2 = Customer.new({:name => "Jenny Jim",  :id => nil, :phone => '666-666-6666', :preference => 'Cats', :breed => 'Macaroni Cats'})
      customer.save()
      customer2.save()
      Customer.clear()
      expect(Customer.all).to(eq([]))
    end
  end

  describe('.find') do
    it("should be able to find a customer by id") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer.save()
      expect(Customer.find(customer.id)).to(eq(customer))
    end
  end

  describe('#delete') do
    it('deletes an customer by id') do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer2 = Customer.new({:name => "Jenny Jim",  :id => nil, :phone => '666-666-6666', :preference => 'Cats', :breed => 'Macaroni Cats'})
      customer.save()
      customer2.save()
      customer.delete()
      expect(Customer.all).to(eq([customer2]))
    end
  end

  describe('#update') do
    it("should be able to update a customers name") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer.save()
      customer.update({:name => "Jenny Jim"})
      expect(customer.name).to(eq("Jenny Jim"))
    end
  end

  describe('#update') do
    it("should be able to update a customers phone") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer.save()
      customer.update({:phone => "666-666-6666"})
      expect(customer.phone).to(eq("666-666-6666"))
    end
  end

  describe('#update') do
    it("should be able to update multiple properties of a customer") do
      customer = Customer.new({:name => "Jimmy John",  :id => nil, :phone => '555-555-5555', :preference => 'Dogs', :breed => 'Sandwich Dogs'})
      customer.save()
      customer.update({:phone => "666-666-6666", :preference => 'Cats'})
      expect(customer.phone).to(eq("666-666-6666")) && expect(customer.preference).to(eq("Cats"))
    end
  end

end
