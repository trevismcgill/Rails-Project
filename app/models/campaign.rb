class Campaign < ApplicationRecord
    belongs_to :character, optional: true
    belongs_to :user
end
