class RemoveAllPaperclipAttributesFromDesigns < ActiveRecord::Migration
  def change
    remove_column :designs, :image_file_name
    remove_column :designs, :image_content_type
    remove_column :designs, :image_file_size
    remove_column :designs, :image_updated_at
    remove_column :designs, :image
  end
end
