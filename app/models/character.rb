class Character < ApplicationRecord
    has_many :campaigns
    has_many :users, through: :campaigns
    validates_presence_of :name, :race, :character_class, :level
end
