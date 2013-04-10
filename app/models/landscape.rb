class Landscape < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :domain_id

  has_many :apps
  has_many :accounts
  belongs_to :domain

end
