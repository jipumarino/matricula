class DeleteIsGuardian < ActiveRecord::Migration
  def self.up
    remove_column :adults, :is_guardian
  end

  def self.down
    add_column :adults, :is_guardian, :boolean
  end
end
