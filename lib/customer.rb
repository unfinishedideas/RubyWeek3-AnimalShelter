class Customer
  attr_reader :id, :name, :phone, :preference, :breed

  def initialize(attributes)
    @id = attributes.fetch(:id).to_i
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @preference = attributes.fetch(:preference)
    @breed = attributes.fetch(:breed)
  end

  def self.all
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each() do |customer|
      id = customer.fetch("id").to_i
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      preference = customer.fetch("preference")
      breed = customer.fetch("breed")
      customers.push(Customer.new({:id => id, :name => name, :phone => phone, :preference => preference, :breed => breed}))
    end
    customers
  end

  def save
    result = DB.exec("INSERT INTO customers (name, phone, preference, breed) VALUES ('#{@name}', '#{@phone}', '#{@preference}', '#{@breed}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def ==(customer_to_compare)
    self.name().downcase().eql?(customer_to_compare.name.downcase()) &&
    self.phone.eql?(customer_to_compare.phone) &&
    self.preference.downcase().eql?(customer_to_compare.preference.downcase()) &&
    self.breed.downcase().eql?(customer_to_compare.breed.downcase())
  end

  def self.clear
    DB.exec("DELETE FROM customers *;")
  end

  def self.find(id)
    customer = DB.exec("SELECT * FROM customers WHERE id = #{id};").first
    id = customer.fetch("id").to_i
    name = customer.fetch("name")
    phone = customer.fetch("phone")
    preference = customer.fetch("preference")
    breed = customer.fetch("breed")
    Customer.new({:id => id, :name => name, :phone => phone, :preference => preference, :breed => breed})
  end

  def update(attributes)
    if (attributes.has_key?(:name)) && (attributes.fetch(:name) != nil)
      @name = attributes.fetch(:name)
      DB.exec("UPDATE customers SET name = '#{@name}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:phone)) && (attributes.fetch(:phone) != nil)
      @phone = attributes.fetch(:phone)
      DB.exec("UPDATE customers SET phone = '#{@phone}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:preference)) && (attributes.fetch(:preference) != nil)
      @preference = attributes.fetch(:preference)
      DB.exec("UPDATE customers SET preference = '#{@preference}' WHERE id = #{@id};")
    end
    if (attributes.has_key?(:breed)) && (attributes.fetch(:breed) != nil)
      @breed = attributes.fetch(:breed)
      DB.exec("UPDATE customers SET breed = '#{@breed}' WHERE id = #{@id};")
    end
  end

  def delete
    DB.exec("DELETE FROM customers WHERE id = #{@id};")
  end

end
