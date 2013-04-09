class CreateBuildResults < ActiveRecord::Migration
  def change
    create_table :build_results do |t|
      t.string :name

      t.timestamps
    end
  end
end
