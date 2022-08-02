class AddInventoryAmountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :inventoryamount, :integer
  end
end
