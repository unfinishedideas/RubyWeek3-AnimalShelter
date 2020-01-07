require 'rspec'
require 'animal'
require('spec_helper')

describe '#Animal' do

  describe('.all') do
    it("returns an empty array when there are no animals") do
      expect(Animal.all).to(eq([]))
    end
  end

  describe('.all') do
    it("returns an array of all animals") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "Hot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Zalbino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      expect(Animal.all).to(eq([animal1, animal2]))
    end
  end

  describe('.all_by_name') do
    it("returns an array of animals organized by name") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "Hot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Zalbino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      expect(Animal.all_by_name).to(eq([animal2, animal1]))
    end
  end

  describe('.all_by_breed') do
    it("returns an array of animals organized by breed") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Albino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      expect(Animal.all_by_breed).to(eq([animal2, animal1]))
    end
  end

  describe('.clear') do
    it("Should clear a database") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Albino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      Animal.clear()
      expect(Animal.all).to(eq([]))
    end
  end

  describe('#save') do
    it("Should save an animal to the database") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal1.save()
      expect(Animal.all).to(eq([animal1]))
    end
  end

  describe('.find') do
    it("Should find an animal by its ID") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Albino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      expect(Animal.find(animal1.id)).to(eq(animal1))
    end
  end

  describe('#update') do
    it("should be able to update a animals name") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal1.save()
      animal1.update({:name => "Jenny Jim"})
      expect(animal1.name).to(eq("Jenny Jim"))
    end
  end

  describe('#update') do
    it("should be able to update a animals type") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal1.save()
      animal1.update({:type => "Cat"})
      expect(animal1.type).to(eq("Cat"))
    end
  end

  describe('#update') do
    it("should be able to update multiple properties of a animal") do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal1.save()
      animal1.update({:name => "Jimmity", :type => 'Cat'})
      expect(animal1.name).to(eq("Jimmity")) && expect(animal1.type).to(eq("Cat"))
    end
  end

  describe('#delete') do
    it('deletes an animal by id') do
      animal1 = Animal.new({:id => nil, :name => "Sammy", :type => "Dog", :breed => "ZzzHot Dog", :gender => "Male", :date_admit => "2019-01-01 00:00:00"})
      animal2 = Animal.new({:id => nil, :name => "Davis", :type => "Cat", :breed => "Albino", :gender => "Female", :date_admit => "2020-02-02 00:00:00"})
      animal1.save()
      animal2.save()
      animal1.delete()
      expect(Animal.all).to(eq([animal2]))
    end
  end

end
