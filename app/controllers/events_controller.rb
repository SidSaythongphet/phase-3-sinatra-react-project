class EventsController < ApplicationController

# Create Event Route



# Read Events Route
    get '/events' do
        @events = Event.all
        @events.to_json(include: [:users, :events])
    end


# Update Event Route



# Delete Event Route


end