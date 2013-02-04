class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :landscape_id
      t.integer :branch_id
      t.boolean :state
      t.string :path

      t.timestamps
    end
  end
end
