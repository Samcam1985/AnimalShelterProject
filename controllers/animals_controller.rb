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

post '/animals' do
  animal = Animal.new(params)
  animal.save
  redirect to("/animals")
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