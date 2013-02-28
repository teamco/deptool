class CreateExternalScripts < ActiveRecord::Migration
  def change
    create_table :external_scripts do |t|
      t.string :script

      t.timestamps
    end
  end
end
