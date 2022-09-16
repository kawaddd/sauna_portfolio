class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.integer :user_id, null: false
      t.integer :sauna_id, null: false
      t.timestamps
    end
  end
end
