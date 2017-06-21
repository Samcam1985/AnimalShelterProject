require_relative('../db/sql_runner')
require('pry')

class Owner

  attr_reader( :id, :name)

def initialize(options)
  @id = options['id'].to_i
  @first_name = options['first_name']
  @surname = options['surname']
  @address = options['address']
  @telephone_number = options['telephone_number']
  @about_owner = options['about_owner']
  
end

def save()
  sql = "INSERT INTO owners (name) 
  VALUES (
  '#{@name}')
  RETURNING *"
  results = SqlRunner.run(sql)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM owners"
  results = SqlRunner.run(sql)
  return results.map { |hash| Owner.new(hash)}
end

def self.delete_all
  sql = "DELETE FROM owners"
  SqlRunner.run(sql)
end

def self.find(id)
  sql = "SELECT * FROM owners WHERE id=#{id};"
  results = SqlRunner.run(sql)
  return Owner.new(results.first)
end

def self.delete(id)
  sql = "DELETE FROM owners where id =#{id}"
  SqlRunner.run(sql)
end


end