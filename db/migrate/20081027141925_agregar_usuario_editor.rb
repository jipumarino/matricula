class AgregarUsuarioEditor < ActiveRecord::Migration
  def self.up
    add_column :surveys, :updated_by, :string
    add_column :adults, :updated_by, :string
    add_column :students, :updated_by, :string
    add_column :family_groups, :updated_by, :string
  end

  def self.down
    remove_column :surveys, :updated_by
    remove_column :adults, :updated_by
    remove_column :students, :updated_by
    remove_column :family_groups, :updated_by
  end
end
