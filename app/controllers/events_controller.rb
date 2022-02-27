class EventsController < ApplicationController

# Create Event
    post '/events' do
        club = Club.find_by_id(params[:club_id])
        event = club.events.build(
            event_title: params[:event_title],
            event_date: params[:event_date]
        )
        if event.save
            club.events << event
            event.to_json
        end 
    end


# Read Events Routes
    get '/events' do
        @events = Event.all
        @events.to_json(include: [:users, :events])
    end

    get '/clubs/:id/events' do
        events = Event.where('club_id = ?', params[:id])
        events.to_json
    end

# Update Event Route
    # update date

# Delete Event Route
    # destroy event

end