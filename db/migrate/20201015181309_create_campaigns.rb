class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.string :setting
      t.integer :min_level
      t.integer :user_id
      t.integer :character_id

      t.timestamps
    end
  end
end
