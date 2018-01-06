class ChangeDueDateFormatForDesigns < ActiveRecord::Migration
  def up
   change_column :designs, :due_date, :string
  end

  def down
   change_column :designs, :due_date, :datetime
  end
end
