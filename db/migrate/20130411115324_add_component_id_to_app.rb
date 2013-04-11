class AddComponentIdToApp < ActiveRecord::Migration
  def up
    add_column :apps, :component_id, :integer
  end

  def down
    remove_column :apps, :component_id
  end
end
