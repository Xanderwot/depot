class AddProductIdToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :product_id, :integer
  end

  def self.down
    remove_column :images, :product_id
  end
end
