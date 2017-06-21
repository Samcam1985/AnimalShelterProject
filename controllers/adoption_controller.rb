
require('pry-byebug')
require_relative('../models/adoption.rb')
require_relative('../models/owner.rb')
require_relative('../models/adoption.rb')
require 'date'


get '/adoptions' do
  @owners = Owner.all
  @adoptions = Adoption.all()
  erb (:"adoptions/index")
end

get '/adoptions/new' do
  @owners = Owner.all
  @animals = Animal.all
  erb (:"/adoptions/new")
end

post '/adoptions/:id/delete' do
  @adoption = Adoption.new( params )
  @adoption.delete(params[:id])
  redirect to("/adoptions")
end


post '/adoptions/new' do
  @adoption = Adoption.new( params )
  @adoption.save()
  erb( :"/adoptions/confirmation")
end




