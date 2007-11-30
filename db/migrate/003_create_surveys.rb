class CreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :surveys do |t|
      t.column :belonging, :string
      t.column :payment_amount, :integer
      t.column :building_material, :string
      t.column :bathroom_belonging, :string
      t.column :hot_water, :boolean
      t.column :bedrooms, :integer
      t.column :beds, :integer
    end
  end

  def self.down
    drop_table :surveys
  end
end
