class AddDesignToApplication < ActiveRecord::Migration
  def change
    add_reference :applications, :design, index: true
  end
end
