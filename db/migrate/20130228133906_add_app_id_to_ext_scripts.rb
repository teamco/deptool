class AddAppIdToExtScripts < ActiveRecord::Migration
  def up
    remove_column :apps, :external_script_id
    add_column :external_scripts, :app_id, :integer
  end

  def down
    add_column :apps, :external_script_id, :integer
    remove_column :external_scripts, :app_id
  end
end
