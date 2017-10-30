class AddItemsTable < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :link
      t.string :target_price
      t.string :current_price
    end
  end
end
