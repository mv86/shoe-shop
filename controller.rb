require 'sinatra'
require 'sinatra/contrib/all'
require 'pry-byebug'
require_relative './models/shoes_order'

get '/shoe_order' do
  erb(:new)
end

post '/shoe_order' do
  @shoe_order = ShoeOrder.new(params)
  @shoe_order.save()
  erb(:confirmation)
end

get '/all_orders' do
  @shoe_orders = ShoeOrder.all()
  erb(:all_orders)
end