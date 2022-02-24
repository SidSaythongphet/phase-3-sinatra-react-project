class UsersClubsController < ApplicationController

    # Create Route

    post '/users_clubs' do
        join = UserClub.new(
            user_id: params[:user_id],
            club_id: params[:club_id]
        )
        if join.save
            join.to_json
        else 
            begin
                raise JoinError
            rescue JoinError => error 
                puts error.message
            end
        end
    end

    
    # Read Route
        get '/users_clubs' do
            @user_club = UserClub.all
            @user_club.to_json
        end
        
    # Update Route
        
        
        
    # Delete Route
    
        
    private

    class JoinError < StandardError
        def message
            "Join table already exists."
        end
    end

    end