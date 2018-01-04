class AddUserToDesigns < ActiveRecord::Migration
  def change
    add_reference :designs, :user, index: true
  end
end
