class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :design, index: true
      t.references :application, index: true
      t.float :price
      t.string :due_date
      t.text :production_plan

      t.timestamps
    end
  end
end
