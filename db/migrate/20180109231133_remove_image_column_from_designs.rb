class RemoveImageColumnFromDesigns < ActiveRecord::Migration
  def change
    remove_column :designs, :image_url
  end
end
