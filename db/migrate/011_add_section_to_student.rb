class AddSectionToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :section, :string
  end

  def self.down
    remove_column :students, :section
  end
end
