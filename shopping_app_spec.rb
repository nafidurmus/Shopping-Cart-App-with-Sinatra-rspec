require File.dirname(__FILE__) + '/shopping_app.rb'
require 'rack/test'

set :environment, :test

def app 
    Sinatra::Application
end



describe 'Auth' do
    include Rack::Test::Methods

    it "Auth login" do
        post '/auth/login'
        expect(last_response).to be_ok   
        #last_response.should be_ok
    end
  
    it "Auth logout" do
        get '/auth/logout'
        expect(last_response).to be_ok
    end
end

describe 'User' do
    include Rack::Test::Methods

    it "get collection of users" do
        get '/users'
        expect( last_response.status ).to eq(200)
    end


    it "create a new user" do 
        post '/users'
        expect( last_response.status ).to eq(200) #201
        
    end

    it "get attiributes of a single user" do
        get '/user/:user_id' #/user/{user_id}
        expect( last_response.status ).to eq(200)

       # expect(last_response)
    end

    it "get cart collection of a user" do 
        get '/user/:user_id/carts' #/user/{user_id}/carts
        expect( last_response.status ).to eq(200)
    end

    it "create a new cart for user" do
        post '/user/:user_id/carts' #/user/{user_id}/carts
        expect( last_response.status ).to eq(404)
    end
end

describe 'Products' do
    include Rack::Test::Methods

    it "get collection of products" do
        get '/products' 
        expect( last_response.status ).to eq(200) 

    end

    it "create a new product" do
        post '/products' 
        expect( last_response.status ).to eq( 200 ) # response = created ? #404
    end

    it "get attiributes of a single product" do
        # products = Products.first(title: 'Products#1')
        #get '/products/:product_id' #/products/{product_id}
        #expect(last_response.body).to include_json(id:products1.id, title: products1.title)
    end
end 

describe 'Cart' do 
    include Rack::Test::Methods
    it "get attributes of a single cart" do
        get '/carts/1' #/carts/{cart_id}
        expect( last_response.status ).to eq(200)
    end

    it "add product to a cart" do 
        post '/carts/1/products' #/carts/{cart_id}/products
        expect( last_response.status ).to eq(200)
    end

    it "delete a product from a cart" do
        delete '/carts/1/products/1' #/carts/{cart_id}/products/{product_id}
        expect( last_response.status ).to eq(200)
    end

    it "set quantity of a product" do 
        put '/carts/2/products/5' #/carts/{cart_id}/products/{product_id}
        expect( last_response.status ).to eq(200)
    end

    it "clean the contents of a cart by removing all of the cart items in the cart" do
        put '/carts/3/clean' #/carts/{cart_id}/clean
        expect( last_response.status ).to eq(200)
    end 
end


















