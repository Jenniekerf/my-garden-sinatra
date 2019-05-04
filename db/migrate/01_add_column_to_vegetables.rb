class AddColumnToVegetables < ActiveRecord::Migration 
  def change 
    add_column :vegetables, :user_id, :integer
  end
end