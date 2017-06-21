require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/animal.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')

get '/animals' do
  @animals = Animal.animal_status()
  erb (:"animals/index")
end

get '/animals/new' do
  @animals = Animal.all
  erb (:"animals/new")
end

get '/animals/:action' do

  #Check what action it is
  #Is it 'all' or 'adoptable' or 'non-adoptable'
  #Use a case statement instead of if statements
  if params[:action] == 'adoptable'
    @animals = Animal.adoptable
  elsif params[:action] == 'non-adoptable'
    @animals = Animal.not_adoptable
  else
    @animals = Animal.animal_status
  end

  erb (:"animals/index")
end


post '/animals/:id/delete' do
  Animal.delete(params[:id])
  redirect to("/animals")
end

post '/animals/new' do
  @animal = Animal.new( params )
  @animal.save()
  erb( :"animals/confirmation")
end