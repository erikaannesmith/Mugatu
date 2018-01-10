class AddDueDateToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :due_date, :date
  end
end
