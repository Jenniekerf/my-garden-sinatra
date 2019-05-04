class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name 
      t.datetime :date_planted
    end
  end
end
