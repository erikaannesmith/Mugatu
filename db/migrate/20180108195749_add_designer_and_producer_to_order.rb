class AddDesignerAndProducerToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :designer_id, :integer
    add_column :orders, :producer_id, :integer
  end
end
