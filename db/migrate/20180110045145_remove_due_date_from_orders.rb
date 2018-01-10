class RemoveDueDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :due_date
  end
end
