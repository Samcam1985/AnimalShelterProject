require_relative('../db/sql_runner')

class Owner

  attr_reader( :id, :name, :admission_date, :adoptable, :type)

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @admission_date = options['admission_date']
  @adoptable = options['adoptable']
  @type = options['type']
  
end

def save()
  sql = "INSERT INTO animals (name) 
  VALUES (
  '#{@name}')
  RETURNING *"
  results = SqlRunner.run(sql)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM animals"
  results = SqlRunner.run(sql)
  return results.map { |hash| Animal.new(hash)}
end

def self.delete_all
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)
end
end