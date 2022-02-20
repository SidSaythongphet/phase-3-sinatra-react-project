class UsersController < ApplicationController
    
# Create User Route
    post '/users' do
        user = User.create(
            first_name: params[:first_name],
            last_name: params[:last_name],
            username: params[:username],
            password: params[:password],
        )
        user.to_json
    end

# Read User Route
    get '/users' do
        @users = User.all
        @users.to_json(include: [:clubs, :events])
    end

    get '/users/:id' do
        find_user
        @user.to_json(include: [:clubs, :events])
    end
    
    private
    
    def find_user
        @user = User.find_by_id(params[:id])
    end

end