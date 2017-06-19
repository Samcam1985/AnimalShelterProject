
require('pry-byebug')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
require 'date'


get '/adoptions' do
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all
  erb (:"/adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save
  redirect to("/adoptions")
end

post '/adoptions/:id/delete' do
  Adoption.delete(params[:id])
  redirect to("/adoptions")
end


post '/adoptions/new' do
  @adoption = Adoption.new( params )
  @adoption.save()
  erb( :"/adoptions/confirmation")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params["id"])
  @adoption = Adoption.all()
  erb(:edit)
end

get '/animals/:id/edit' do
  @owner = Animal.find(params["id"])
  @animal = Adoption.all()
  erb(:edit)
end
