class AddColumnToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :cover_image_uid, :string
    add_column :products, :cover_image_name, :string
  end

  def self.down
    remove_column :products, :cover_image_name
    remove_column :products, :cover_image_uid
  end
end
