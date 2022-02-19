class ClubsController < ApplicationController

# Create Club Route
    post '/clubs' do
        
    end

# Read Clubs Route
    get '/clubs' do
        @clubs = Club.all
        @clubs.to_json(include: [:users, :events])
    end

# Update Club Route



# Delete Club Route

end