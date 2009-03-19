class AgregarCampos2009AEncuesta < ActiveRecord::Migration
  def self.up
    add_column :surveys, :chile_califica, :boolean, :default => false
    add_column :surveys, :chile_solidario, :boolean, :default => false
    add_column :surveys, :puente, :boolean, :default => false
    add_column :surveys, :suf, :boolean, :default => false
  end

  def self.down
    remove_column :surveys, :chile_califica
    remove_column :surveys, :chile_solidario
    remove_column :surveys, :puente
    remove_column :surveys, :suf
  end
end
