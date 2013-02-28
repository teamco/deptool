class ExternalScript < ActiveRecord::Base
  attr_accessible :script

  has_many :apps
end
