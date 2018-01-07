class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :status, default: 0
      t.text :production_plan
      t.string :due_date
      t.float :price
    end
  end
end
