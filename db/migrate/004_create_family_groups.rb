class CreateFamilyGroups < ActiveRecord::Migration
  def self.up
    create_table :family_groups do |t|
      t.column :guardian_id, :integer
      t.column :survey_id, :integer
    end
  end

  def self.down
    drop_table :family_groups
  end
end
