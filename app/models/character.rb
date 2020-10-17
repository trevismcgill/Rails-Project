class Character < ApplicationRecord
    belongs_to :user
    belongs_to :campaigns, optional: true
    validates_presence_of :name, :race, :character_class, :level
end
