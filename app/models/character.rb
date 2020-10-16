class Character < ApplicationRecord
    belongs_to :campaign, optional: true
    belongs_to :user
    validates_presence_of :name, :race, :character_class, :level
end
