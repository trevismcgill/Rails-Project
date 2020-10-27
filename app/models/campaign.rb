class Campaign < ApplicationRecord
    has_many :characters
    has_many :users, :through => :characters
    validates :campaign_name, :setting, :min_level, :presence => true

    # def self.campaign_options
    #     @campaign_options = Campaign.all.collect do |c| 
    #         c.campaign_name
    #         c.id
    #     end
    # end

end
