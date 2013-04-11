class App < ActiveRecord::Base
  attr_accessible :name, :path, :state, :landscape_id, :branch_id, :external_script_id, :component_id, :user_id

  belongs_to :landscape
  belongs_to :branch
  belongs_to :component
  belongs_to :user

  has_many :external_scripts
end
