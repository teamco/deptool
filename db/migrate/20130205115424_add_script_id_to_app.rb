class AddScriptIdToApp < ActiveRecord::Migration
  def up
    add_column :apps, :script_id, :integer
  end

  def down
    remove_column :apps, :script_id
  end
end
