class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.column :line1, :string
      t.column :line2, :string
      t.column :comuna, :string
    end
  end

  def self.down
    drop_table :addresses
  end
end
