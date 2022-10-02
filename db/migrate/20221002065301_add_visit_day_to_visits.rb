class AddVisitDayToVisits < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :Visit_day, :date
  end
end
