class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.integer :user_id
      t.string :store_name, null: false
      # index
      t.string :phone_number,  unique: true
      t.string :address
      t.string :transportation
      t.string :business_hours
      t.string :regular_holiday
      t.string :homepage_link
      t.string :store_image
      t.boolean :approval_flag, default: false, null: false
      t.timestamps
    end
  end
end
