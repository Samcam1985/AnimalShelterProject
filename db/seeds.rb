require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
require_relative('../models/animal.rb')

require('pry-byebug')



Adoption.delete_all
Animal.delete_all
Owner.delete_all


owner1 = Owner.new ({
  'full_name' => "Sam Campbell",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Samantha Campbell, I live in a ground floor flat and am looking to give a home to an animal in need, preferably a cat as I am out all day."
  })

owner1.save

owner2 = Owner.new ({
  'full_name' => "Bob Brown",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Bob Brown, I live in a top floor flat and am looking for a cat to adopt."
  })

owner2.save

owner3 = Owner.new ({
  'full_name' => "Justine Smith",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Justine Smith, I live in a 3 bedroom house with a big garden. Would love to adopt a couple of dogs."
  })

owner3.save

owner4 = Owner.new ({
  'full_name' => "Martin Jones",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Martin Jones, I live in a 2 bedroom house with a small garden."
  })

owner4.save

owner5 = Owner.new ({
  'full_name' => "Caroline Mitchell",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Caroline Mitchell, I live in a 4 bedroom house and would like to adopt a cat. I have 2 children and 2 cats already and would be interested in adopting another cat."
  })

owner5.save

owner6 = Owner.new ({
  'full_name' => "Colin Stewart",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Colin Stewart, I live in a ground floor flat on my own, I would love to adopt a dog to keep me company and allow me to take on long walks. Unfortunatly I cannot adopt cats as I am allergic."
  })

owner6.save

owner7 = Owner.new ({
  'full_name' => "Sara Goodwin",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Sara Goodwin, I live in a cottage and am looking to give a home to an animal in need, I like both cats and dogs so would love to adopt either."
  })

owner7.save

owner8 = Owner.new ({
  'full_name' => "Andrew Conners",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Andrew Conners, I live in a 4 bedroom house and am looking to give a home to up to 3 dogs. I work in a vet and so am already familiar with the behaviours and needs of dogs."
  })

owner8.save

owner9 = Owner.new ({
  'full_name' => "Olivia Peters",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Olivia Peters, I live in a ground floor flat and am looking to give a home to an animal in need, preferably a cat as I am out all day."
  })

owner9.save

owner10 = Owner.new ({
  'full_name' => "Flora Stevens",
  'address' => "Codeclan, 37 Castle Terrace, Edinburgh, EH1 2EL",
  'telephone_number' => "0131 290 2600",
  'about_owner' => "My name is Flora Stevens, I live in a ground floor flat and am looking to give a home to an dog in need. I work from home so would be willing to take in a puppy as I have time to train and walk it properly."
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

binding.pry
nil
