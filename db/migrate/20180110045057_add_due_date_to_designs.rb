class AddDueDateToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :due_date, :date
  end
end
