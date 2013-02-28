class RemoveScriptIdToApp < ActiveRecord::Migration
  def up
    remove_column :apps, :script_id
  end

  def down
    add_column :apps, :script_id, :integer
  end
end
