class AddAccountToLandscape < ActiveRecord::Migration
  def up
    add_column :landscapes, :account_id, :integer
  end

  def down
    remove_column :landscapes, :account_id
  end
end
