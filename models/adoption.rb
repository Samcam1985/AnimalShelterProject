require_relative('../db/sql_runner')

class Adoption

  attr_accessor( :id, :date_of_adoption, :owner_id, :animal_id)


def initialize(options)
  @id = options['id'].to_i
  @date_of_adoption = options['date_of_adoption']
  @owner_id = options['owner_id']
  @animal_id = options['animal_id']
end

def save()
  sql = "INSERT INTO adoptions (date_of_adoption, owner_id, animal_id) 
  VALUES (
  '#{@date_of_adoption}', #{@owner_id}, #{@animal_id})
  RETURNING *"
results = SqlRunner.run(sql)
  @id = results.first()['id'].to_i

  update(@animal_id)
end

def update(animal_id)
  sql = "UPDATE animals SET adoptable = 'FALSE' where id = #{animal_id}"
  SqlRunner.run(sql)
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

def animal
  sql = "SELECT * FROM animals INNER JOIN adoptions
  ON adoptions.animal_id = animals.id
  WHERE animals.id = #{@animal_id}"
  adopted_animals = SqlRunner.run(sql)
  return Animal.new(adopted_animals.first)
end

def owner
  sql = "SELECT * FROM owners INNER JOIN adoptions
  ON adoptions.owner_id = owners.id
  WHERE owners.id = #{@owner_id}"
  adoptive_owners = SqlRunner.run(sql)
  return Owner.new(adoptive_owners.first)
end

def self.find(id)
  sql = "SELECT * FROM adoptions WHERE id=#{id};"
  result = SqlRunner.run(sql)
  return Adoption.new(result.first)
end

def self.delete(id)
  sql = "DELETE FROM adoptions where id =#{id}"
  SqlRunner.run(sql)
end

end
 


