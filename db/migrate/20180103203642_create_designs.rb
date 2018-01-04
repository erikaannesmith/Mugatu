class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.datetime :due_date
      t.string :price_range

      t.timestamps
    end
  end
end
