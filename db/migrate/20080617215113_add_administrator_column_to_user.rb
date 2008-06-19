class AddAdministratorColumnToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :administrator, :boolean, :default => false
    User.new(:name => 'Administrador', :login => 'admin', :password => 'admin', :administrator => true)
  end

  def self.down
    remove_column :users, :administrator
  end
end
