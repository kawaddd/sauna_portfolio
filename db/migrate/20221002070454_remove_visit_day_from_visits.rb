class RemoveVisitDayFromVisits < ActiveRecord::Migration[6.1]
  def change
    remove_column :visits, :Visit_day, :date
  end
end
