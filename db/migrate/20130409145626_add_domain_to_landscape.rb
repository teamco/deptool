class AddDomainToLandscape < ActiveRecord::Migration
  def up
    add_column :landscapes, :domain_id, :integer
  end

  def down
    remove_column :landscapes, :domain_id
  end
end
