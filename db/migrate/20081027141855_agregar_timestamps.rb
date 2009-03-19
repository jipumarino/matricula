class AgregarTimestamps < ActiveRecord::Migration
  def self.up
    add_column :surveys, :created_on, :timestamp
    add_column :adults, :created_on, :timestamp
    add_column :students, :created_on, :timestamp
    add_column :family_groups, :created_on, :timestamp
    add_column :surveys, :updated_on, :timestamp
    add_column :adults, :updated_on, :timestamp
    add_column :students, :updated_on, :timestamp
    add_column :family_groups, :updated_on, :timestamp
  end

  def self.down
    remove_column :surveys, :created_on
    remove_column :adults, :created_on
    remove_column :students, :created_on
    remove_column :family_groups, :created_on
    remove_column :surveys, :updated_on
    remove_column :adults, :updated_on
    remove_column :students, :updated_on
    remove_column :family_groups, :updated_on
  end
end
