require 'sinatra'

post '/auth/login' do
    "Hello World"
end

get '/auth/logout' do
end

get '/users' do
end

post '/users' do
end

get '/user/{user_id}' do
end

get '/user/{user_id}/carts' do
end

post '#/user/{user_id}/carts' do
end

get '/products'  do
end

post '/products' do
end

get '/carts/{cart_id}' do
end

post '/carts/{cart_id}/products' do 
end

delete '/carts/{cart_id}/products/{product_id}' do
end

put '/carts/{cart_id}/products/{product_id}' do
end

put '/carts/{cart_id}/clean' do
end