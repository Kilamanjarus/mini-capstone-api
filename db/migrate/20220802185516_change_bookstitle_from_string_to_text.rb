class ChangeBookstitleFromStringToText < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :title, :text
  end
end
