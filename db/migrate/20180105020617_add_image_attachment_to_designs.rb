class AddImageAttachmentToDesigns < ActiveRecord::Migration
  def self.up
    change_table :designs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :designs, :image_url
  end
end
