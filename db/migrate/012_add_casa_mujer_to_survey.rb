class AddCasaMujerToSurvey < ActiveRecord::Migration
  def self.up
    add_column :surveys, :casa_mujer, :boolean
  end

  def self.down
    remove_column :surveys, :casa_mujer
  end
end
