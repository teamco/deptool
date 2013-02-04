class Landscape < ActiveRecord::Base
  attr_accessible :name

  has_many :apps

end
