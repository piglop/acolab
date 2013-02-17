class AddOwnerToImage < ActiveRecord::Migration
  def change
    add_column :images, :owner_id, :integer
    add_index :images, :owner_id
  end
end
