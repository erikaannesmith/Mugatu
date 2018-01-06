class AddAttachmentImageToDesigns < ActiveRecord::Migration
  def up
    add_attachment :designs, :image
  end

  def down
    remove_attachment :designs, :image
  end
end
