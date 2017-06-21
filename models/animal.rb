require_relative('../db/sql_runner')

class Animal

  attr_reader( :id, :name, :admission_date, :adoptable, :adoption_status, :type)

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @admission_date = options['admission_date']
  @adoptable = options['adoptable']

  if options['owner_id'] 
    @adoption_status = 'Adopted'
  else
    @adoption_status = 'Not Adopted'
  end
  
  @type = options['type']
  
end

def save()
  sql = "INSERT INTO animals (name, admission_date, adoptable, type) 
  VALUES (
  '#{@name}', '#{@admission_date}', #{@adoptable}, '#{@type}')
  RETURNING *"
  results = SqlRunner.run(sql)
  @id = results.first()['id'].to_i
end

#used in drop down for animals available for adoption, if already adopted then cant be available to adopt.
def self.all()
  sql = "SELECT * FROM animals WHERE adoptable = 'TRUE' AND id not IN (SELECT animal_id FROM adoptions)";
  results = SqlRunner.run(sql)
  return results.map { |hash| Animal.new(hash)}
end

#used for animals page, if animal has owner id then status will say adopted.
def self.animal_status()
  sql = "SELECT animals.*, adoptions.owner_id FROM animals LEFT JOIN adoptions ON adoptions.animal_id = animals.id"
  results = SqlRunner.run(sql)
  return results.map { |hash| Animal.new(hash)}
end

def self.delete_all
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)
end

#if animal doesnt have an adoption id then it will and it is adoptable then it is adoptable.
def self.adoptable
  sql = "SELECT * FROM animals WHERE animals.id NOT IN (SELECT animal_id FROM adoptions) AND animals.adoptable = 'TRUE' "
  adoptable_animals = SqlRunner.run(sql)
  return adoptable_animals.map { |hash| Animal.new(hash)}
end

def self.not_adoptable
  sql = "SELECT * FROM animals WHERE adoptable = 'FALSE'"
  not_adoptable_animals = SqlRunner.run(sql)
  return not_adoptable_animals.map { |hash| Animal.new(hash)}
end


def self.delete(id)
  sql = "DELETE FROM animals where id =#{id}"
  SqlRunner.run(sql)
end


end