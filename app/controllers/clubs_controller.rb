class ClubsController < ApplicationController

# Create Club Route
    post '/clubs' do
        user = User.find_by_id(params[:admin])
        club = user.clubs.build(
            club_title: params[:club_title],
            description: params[:description],
            admin: params[:admin]    
        )
        if club.save
            user.clubs << club
            club.to_json
        end 
    end

# Read Clubs Route
    get '/clubs' do
        @clubs = Club.all
        @clubs.to_json(include: [:users, :events])
    end

    get '/clubs/:id' do
        find_club
        @club.to_json(include: [:users, :events])
    end
    
    # Update Club Route
    
    
    
    # Delete Club Route

    private
    def find_club
        @club = Club.find_by_id(params[:id])
    end

end