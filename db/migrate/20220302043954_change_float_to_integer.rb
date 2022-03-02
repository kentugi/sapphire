class ChangeFloatToInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :boats, :price, :float
    add_column :boats, :price, :integer
  end
end
