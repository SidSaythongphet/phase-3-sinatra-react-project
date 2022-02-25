class UsersController < ApplicationController
    
# Create User Route
    post '/users' do
        user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            username: params[:username],
            password: params[:password],
        )
        user.to_json(include: {clubs: { include:  :events } })
    end

# Read User Route
    get '/users' do
        @user = User.all
        @user.to_json(include: {clubs: { include:  :events } })
    end

    get '/users/:id' do
        find_user
        @user.to_json(include: {clubs: { include:  :events } })
    end

    
# Update User Route

    patch '/users/:id' do
        find_user
        @user.update(
            username: params[:username],
            password: params[:password]
        )
        @user.to_json
    end

# Delete User Route

    delete '/users/:id' do
        find_user
        @user.destroy
        @user.to_json
    end

private
    
    def find_user
        @user = User.find_by_id(params[:id])
    end

end