class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :efficiency
      t.integer :accuracy
    end
  end
end
