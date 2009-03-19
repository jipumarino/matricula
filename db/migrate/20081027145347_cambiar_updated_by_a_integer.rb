class CambiarUpdatedByAInteger < ActiveRecord::Migration
  def self.up
    remove_column :surveys, :updated_by
    remove_column :adults, :updated_by
    remove_column :students, :updated_by
    remove_column :family_groups, :updated_by
    add_column :surveys, :updated_by, :integer
    add_column :adults, :updated_by, :integer
    add_column :students, :updated_by, :integer
    add_column :family_groups, :updated_by, :integer
  end

  def self.down
    remove_column :surveys, :updated_by
    remove_column :adults, :updated_by
    remove_column :students, :updated_by
    remove_column :family_groups, :updated_by
    add_column :surveys, :updated_by, :string
    add_column :adults, :updated_by, :string
    add_column :students, :updated_by, :string
    add_column :family_groups, :updated_by, :string
  end
end
