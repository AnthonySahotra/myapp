class AddNameToMonsters < ActiveRecord::Migration
  def change
    add_column :monsters, :name, :string
    add_column :monsters, :power, :string
    add_column :monsters, :type, :string
  end
end
