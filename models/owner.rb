require_relative('../db/sql_runner')
require('pry')

class Owner

  attr_reader( :id, :name, :address, :telephone_number, :about_owner)

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
  @address = options['address']
  @telephone_number = options['telephone_number']
  @about_owner = options['about_owner']
  
end

def save()
  sql = "INSERT INTO owners (name, address, telephone_number, about_owner) 
  VALUES (
  '#{@name}', '#{@address}', '#{@telephone_number}', '#{@about_owner}')
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