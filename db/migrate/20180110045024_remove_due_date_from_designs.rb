class RemoveDueDateFromDesigns < ActiveRecord::Migration
  def change
    remove_column :designs, :due_date
  end
end
