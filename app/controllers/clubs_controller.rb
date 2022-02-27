class ClubsController < ApplicationController

# Create Club
    post '/clubs' do
        user = User.find_by_id(params[:admin])
        club = user.clubs.build(
            club_title: params[:club_title],
            description: params[:description],
            admin: params[:admin]    
        )
        if club.save
            user.clubs << club
            club.to_json(include: [:users, :events])
        end 
    end

# Read Clubs Routes
    # get all clubs
    get '/clubs' do
        @clubs = Club.all
        @clubs.to_json(include: [:users, :events])
    end

    # get specific club
    get '/clubs/:id' do
        find_club
        @club.to_json(include: [:users, :events, :posts])
    end

# Update Club Route
    # update club title/description
    
# Delete Club Route
    # destroy club and associated tables

    private
    def find_club
        @club = Club.find_by_id(params[:id])
    end

end