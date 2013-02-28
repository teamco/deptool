class AddExtscriptIdToApp < ActiveRecord::Migration
  def up
    add_column :apps, :external_script_id, :integer
  end

  def down
    remove_column :apps, :external_script_id
  end
end
