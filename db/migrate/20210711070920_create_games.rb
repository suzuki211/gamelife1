class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.text :title
      t.string :image_id
      t.text :impressions
      t.integer :user_id
      t.integer :genre_id
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps
    end
  end
end
