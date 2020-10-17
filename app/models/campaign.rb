class Campaign < ApplicationRecord
    belongs_to :character, optional: true
    belongs_to :user
    validates_presence_of :campaign_name, :setting, :min_level
end
