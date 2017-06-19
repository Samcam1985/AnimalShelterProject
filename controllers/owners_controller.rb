require('pry-byebug')
require_relative('../models/owner.rb')
require_relative('../models/animal.rb')
require_relative('../models/adoption.rb')

get '/owners' do
  @owners = Owner.all()
  erb (:"owners/index")
end

get '/owners/new' do
  @owners = Owner.all
  erb (:"owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save
  redirect to("/owners")
end

post '/owners/:id/delete' do
  Owner.destroy(params[:id])
  redirect to("/owners")
end


post '/owners/new' do
  @owner = Owner.new( params )
  @owner.save()
  erb( :create)
end

# get '/owners/:id/edit' do
#   @owner = Owner.find(params["id"])
#   @adoption = Adoption.all()
#   erb(:edit)
# end

# get '/owners/:id' do 
#   @owner = Owner.find( params[:id])
#   erb( :show)
#   end