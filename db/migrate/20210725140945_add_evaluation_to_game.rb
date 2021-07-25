class AddEvaluationToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :evaluation, :float
  end
end
