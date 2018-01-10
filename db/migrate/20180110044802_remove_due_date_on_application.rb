class RemoveDueDateOnApplication < ActiveRecord::Migration
  def change
    remove_column :applications, :due_date
  end
end
