class ChangeColumn < ActiveRecord::Migration
  def change
    rename_column :vegetables, :user_id, :gardener_id
  end
end
