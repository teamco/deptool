class CreatePropertiesPaths < ActiveRecord::Migration
  def change
    create_table :properties_paths do |t|
      t.string :name

      t.timestamps
    end
  end
end
