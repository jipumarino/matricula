class AddPhone < ActiveRecord::Migration
  def self.up
    add_column :adults, :phone_number_1, :string
    add_column :adults, :phone_number_2, :string
    add_column :students, :phone_number_1, :string
    add_column :students, :phone_number_2, :string
  end

  def self.down
    remove_column :adults, :phone_number_1
    remove_column :adults, :phone_number_2
    remove_column :students, :phone_number_1
    remove_column :students, :phone_number_2
  end
end
