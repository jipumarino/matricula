class AddIsGuardianToAdult < ActiveRecord::Migration
  def self.up
    add_column :adults, :is_guardian, :boolean
  end

  def self.down
    remove_column :adults, :is_guardian
  end
end
