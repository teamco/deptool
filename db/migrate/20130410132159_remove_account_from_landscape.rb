class RemoveAccountFromLandscape < ActiveRecord::Migration
  def up
    remove_column :landscapes, :account_id
  end

  def down
    add_column :landscapes, :account_id, :integer
  end
end
