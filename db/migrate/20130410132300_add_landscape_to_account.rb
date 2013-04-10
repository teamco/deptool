class AddLandscapeToAccount < ActiveRecord::Migration
  def up
    add_column :accounts, :landscape_id, :integer
  end

  def down
    remove_column :accounts, :landscape_id
  end
end
