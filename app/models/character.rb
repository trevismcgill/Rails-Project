class Character < ApplicationRecord
    belongs_to :user
    belongs_to :campaign, optional: true
    validates :name, :race, :character_class, :level, presence: true
    validate :character_level_high_enough_to_join_campaign, on: :create

    scope :character_class_filter, -> (query) { where("LOWER(character_class) LIKE ?", "#{query.downcase.singularize}") }

    
    def character_level_high_enough_to_join_campaign
        if !can_join_campaign?
            errors.add( :level, "is too low to join this campaign!")
        end
    end

    def can_join_campaign?
      campaign_id? && level >= campaign.min_level
    end
end
