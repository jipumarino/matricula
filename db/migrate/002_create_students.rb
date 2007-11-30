class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.column "run",             :string
      t.column "fathers_name",    :string
      t.column "mothers_name",    :string
      t.column "names",           :string
      t.column "sex",             :string
      t.column "birthday",        :date
      t.column "current_level",   :string
      t.column "next_level",      :string
      t.column "family_group_id", :integer
    end
  end

  def self.down
    drop_table :students
  end
end
