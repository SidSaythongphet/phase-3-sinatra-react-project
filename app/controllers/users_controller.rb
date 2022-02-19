class UsersController < ApplicationController
    
# Create User Route
    post '/users' do
            
    end

# Read User Route
    get '/users' do
        @users = User.all
        @users.to_json(include: [:clubs, :events])
    end

end