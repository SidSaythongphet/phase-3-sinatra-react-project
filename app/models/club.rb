class Club < ActiveRecord::Base
    has_many :events
    has_many :user_clubs
    has_many :users, through: :user_clubs
end