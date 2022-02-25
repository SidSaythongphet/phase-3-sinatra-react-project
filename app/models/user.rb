class User < ActiveRecord::Base
    has_many :user_clubs, dependent: :destroy
    has_many :clubs, through: :user_clubs
    has_many :events, through: :clubs
    has_many :posts, dependent: :destroy
end