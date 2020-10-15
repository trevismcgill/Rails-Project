class CreateCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :campaign_name
      t.string :setting
      t.integer :min_level

      t.timestamps
    end
  end
end
