class AddDueDateToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :due_date, :date
  end
end
