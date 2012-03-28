class AddRoleToUser < ActiveRecord::Migration
  def self.up
    change_column :users, :role, :string, :default => "user"
  end

  def self.down
    remove_column :users, :role
  end
end
