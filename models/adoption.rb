require_relative('../db/sql_runner')

class Adoption

  attr_reader( :id, :date, :owner_id, :animal_id)

def initialize(options)
  @id = options['id'].to_i
  @date = options['date']
  @owner_id = options['owner_id']
  @animal_id = options['animal_id']
end

def save()
  sql = "INSERT INTO adoptions (date, owner_id, animal_id) 
  VALUES (
  '#{date}', #{owner_id}, #{animal_id})
  RETURNING *"
  results = SqlRunner.run(sql)
  @id = results.first()['id'].to_i
end

def self.all()
  sql = "SELECT * FROM adoptions"
  results = SqlRunner.run(sql)
  return results.map { |hash| Adoption.new(hash)}
end

def self.delete_all
  sql = "DELETE FROM adoptions"
  SqlRunner.run(sql)
end
end