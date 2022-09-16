class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id, null: false
      t.integer :sauna_id, null: false
      t.float :score, null: false
      t.string :headline, null: false
      t.text :text, null: false
      t.date :visit_day, null: false
      t.timestamps
    end
  end
end
