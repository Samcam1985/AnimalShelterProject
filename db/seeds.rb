require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
require_relative('../models/animal.rb')



Adoption.delete_all
Animal.delete_all
Owner.delete_all


owner1 = Owner.new ({
  'name' => "Sam"
  })

owner1.save

owner2 = Owner.new ({
  'name' => "Richard"
  })

owner2.save

owner3 = Owner.new ({
  'name' => "Justine"
  })

owner3.save

owner4 = Owner.new ({
  'name' => "Martin"
  })

owner4.save

owner5 = Owner.new ({
  'name' => "Caroline"
  })

owner5.save

owner6 = Owner.new ({
  'name' => "Colin"
  })

owner6.save

owner7 = Owner.new ({
  'name' => "Sara"
  })

owner7.save

owner8 = Owner.new ({
  'name' => "Andrew"
  })

owner8.save

owner9 = Owner.new ({
  'name' => "Olivia"
  })

owner9.save

owner10 = Owner.new ({
  'name' => "Flora"
  })

owner10.save

animal1 = Animal.new ({
  'name' => "Vigo",
  'admission_date' => "2017-11-03",
  'adoptable' => "TRUE",
  'type' => "Cat"
  })

animal1.save

animal2 = Animal.new ({
  'name' => "Scully",
  'admission_date' => "2017-04-14",
  'adoptable' => "TRUE",
  'type' => "Cat"
  })

animal2.save

animal3 = Animal.new ({
  'name' => "Star",
  'admission_date' => "2017-05-24",
  'adoptable' => "TRUE",
  'type' => "Cat"
  })

animal3.save

animal4 = Animal.new ({
  'name' => "Gemini",
  'admission_date' => "2017-06-03",
  'adoptable' => "FALSE",
  'type' => "Cat"
  })

animal4.save

animal5 = Animal.new ({
  'name' => "Zak",
  'admission_date' => "2017-06-01",
  'adoptable' => "FALSE",
  'type' => "Dog"
  })

animal5.save

animal6 = Animal.new ({
  'name' => "Roscoe",
  'admission_date' => "2017-05-23",
  'adoptable' => "FALSE",
  'type' => "Dog"
  })

animal6.save

adoption1 = Adoption.new ({
  'date_of_adoption' => "2017-03-24", 
  'animal_id' => animal1.id,
  'owner_id' => owner1.id
  })

adoption1.save

adoption2 = Adoption.new ({
  'date_of_adoption' => "2017-06-18",
  'animal_id' => animal5.id,
  'owner_id' => owner7.id
  })

adoption2.save

adoption3 = Adoption.new ({
  'date_of_adoption' => "2017-06-02",
  'animal_id' => animal3.id,
  'owner_id' => owner1.id
  })

adoption3.save


