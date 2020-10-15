class Character < ApplicationRecord
    has_many :campaigns
    belongs_to :user
end
