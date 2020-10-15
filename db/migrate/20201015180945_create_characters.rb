class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :class
      t.string :race
      t.integer :user_id
      t.integer :campaign_id
      t.timestamps
    end
  end
end
