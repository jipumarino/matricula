class AgregarSaludAEncuesta < ActiveRecord::Migration
  def self.up
    add_column :surveys, :sistema_salud, :string
  end

  def self.down
    remove_column :surveys, :sistema_salud
  end
end
