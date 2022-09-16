class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.integer :user_id, null: false
      t.string :store_name, null: false
      # index
      t.string :phone_number, null: false, unique: true
      t.string :address, null: false
      t.string :transportation, null: false
      t.string :business_hours, null: false
      t.string :regular_holiday, null: false
      t.string :homepage_link, null: false
      t.string :store_image, null: false
      t.string :genre, null: false
      t.boolean :approval_flag, default: false, null: false
      t.timestamps
    end
  end
end
