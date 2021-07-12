class CreateGameComments < ActiveRecord::Migration[5.2]
  def change
    create_table :game_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :gamme_id

      t.timestamps
    end
  end
end
