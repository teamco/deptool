class Landscape < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :account_id
  attr_accessible :domain_id

  has_many :apps
  belongs_to :account
  belongs_to :domain

end
