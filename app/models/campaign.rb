class Campaign < ApplicationRecord
    has_many :characters
    has_many :users, through: :characters
    validates_presence_of :campaign_name, :setting, :min_level
end
