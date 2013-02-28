class App < ActiveRecord::Base
  attr_accessible :name, :path, :state, :landscape_id, :branch_id, :external_script_id

  belongs_to :landscape
  belongs_to :branch
  belongs_to :external_script
end
