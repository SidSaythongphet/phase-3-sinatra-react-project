class User < ActiveRecord::Base
    has_many :user_clubs
    has_many :clubs, through: :user_clubs
    has_many :events, through: :clubs
end