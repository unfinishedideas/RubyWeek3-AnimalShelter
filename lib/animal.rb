class Animal
  attr_reader :id, :name, :breed, :type, :date_admit, :gender


  def initialize (attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @breed = attributes.fetch(:breed)
    @type = attributes.fetch(:type)
    @date_admit = attributes.fetch(:date_admit)
    @gender = attributes.fetch(:gender)
  end

  def self.all
    returned_animals = DB.exec("SELECT * FROM animals;")
    animals = []
    returned_animals.each()do |animal|
    id = animal.fetch("id").to_i
    name = animal.fetch("name")
    breed = animal.fetch("breed")
    type = animal.fetch("type")
    date_admit = animal.fetch("date_admit")
    gender = animal.fetch("gender")
    animals.push(Animal.new({:id => id, :name => name, :breed => breed, :type => type, :date_admit => date_admit, :gender => gender}))
  end
  animals
end



end
