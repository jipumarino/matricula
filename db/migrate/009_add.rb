class Add < ActiveRecord::Migration
  def self.up
    add_column :addresses, :family_group_id, :integer
  end

  def self.down
    remove_column :addresses, :family_group_id
  end
end
