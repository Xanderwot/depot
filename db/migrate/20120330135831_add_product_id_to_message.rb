class AddProductIdToMessage < ActiveRecord::Migration
  def self.up
    add_column :messages, :product_id, :integer
  end

  def self.down
    remove_column :messages, :product_id
  end
end
