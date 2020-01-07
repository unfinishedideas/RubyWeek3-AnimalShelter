class Animal
  attr_reader :id, :name, :breed, :type, :date_admit, :gender, :owner_id
  attr_accessor :owner_id

  def initialize (attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
    @gender = attributes.fetch(:gender)
    @date_admit = attributes.fetch(:date_admit)
    @owner_id = attributes.fetch(:owner_id)
  end

  def self.all
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each()do |animal|
      id = animal.fetch("id").to_i
      name = animal.fetch("name")
      type = animal.fetch("type")
      breed = animal.fetch("breed")
      gender = animal.fetch("gender")
      date_admit = animal.fetch("date_admit")
      owner_id = animal.fetch("owner_id").to_i
      animals.push(Animal.new({:id => id, :name => name, :breed => breed, :type => type, :date_admit => date_admit, :gender => gender, :owner_id => owner_id}))
    end
    animals
  end

  def self.all_by_name
    self.all.sort_by {|animal| animal.name}
  end

  def self.all_by_breed
    self.all.sort_by {|animal| animal.breed}
  end

  def self.all_by_date
    self.all.sort_by {|animal| animal.date_admit}
  end

  def ==(animal_to_compare)
    self.name().downcase().eql?(animal_to_compare.name.downcase()) &&
    self.type.downcase().eql?(animal_to_compare.type.downcase()) &&
    self.breed.downcase().eql?(animal_to_compare.breed.downcase()) &&
    self.gender.downcase().eql?(animal_to_compare.gender.downcase()) &&
    self.date_admit.downcase().eql?(animal_to_compare.date_admit.downcase())
  end

  def save
    result = DB.exec("INSERT INTO animals (name, type, breed, gender, date_admit) VALUES ('#{@name}', '#{@type}', '#{@breed}', '#{@gender}', '#{@date_admit}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.clear
    DB.exec("DELETE FROM animals *;")
  end

  def self.find(id)
    animal = DB.exec("SELECT * FROM animals WHERE id = #{id};").first
    id = animal.fetch("id").to_i
    name = animal.fetch("name")
    type = animal.fetch("type")
    breed = animal.fetch("breed")
    gender = animal.fetch("gender")
    date_admit = animal.fetch("date_admit")
    owner_id = animal.fetch("owner_id").to_i
    Animal.new({:id => id, :name => name, :breed => breed, :type => type, :date_admit => date_admit, :gender => gender, :owner_id => owner_id})
  end

  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE animals SET name = '#{@name}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:type)) && (attributes.fetch(:type) != nil)
      @type = attributes.fetch(:type)
      DB.exec("UPDATE animals SET type = '#{@type}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:breed)) && (attributes.fetch(:breed) != nil)
      @breed = attributes.fetch(:breed)
      DB.exec("UPDATE animals SET breed = '#{@breed}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:gender)) && (attributes.fetch(:gender) != nil)
      @gender = attributes.fetch(:gender)
      DB.exec("UPDATE animals SET gender = '#{@gender}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:date_admit)) && (attributes.fetch(:date_admit) != nil)
      @date_admit = attributes.fetch(:date_admit)
      DB.exec("UPDATE animals SET date_admit = '#{@date_admit}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:owner_id)) && (attributes.fetch(:owner_id) != nil)
      @owner_id = attributes.fetch(:owner_id)
      DB.exec("UPDATE animals SET owner_id = '#{@owner_id}' WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM animals WHERE id = #{@id};")
  end

end
