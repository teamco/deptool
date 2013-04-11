class AddUserIdToApp1 < ActiveRecord::Migration
  def up
    add_column :apps, :user_id, :integer
  end

  def down
    remove_column :apps, :user_id
  end
end
