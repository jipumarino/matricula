class CreateAdults < ActiveRecord::Migration
  def self.up
    create_table "adults" do |t|
      t.column "run",             :string
      t.column "fathers_name",    :string
      t.column "mothers_name",    :string
      t.column "names",           :string
      t.column "sex",             :string
      t.column "birthday",        :date
      t.column "education_level", :string
      t.column "occupation",      :string
      t.column "income",          :integer
      t.column "family_group_id", :integer
    end
  end

  def self.down
    drop_table "adults"
  end
end
