class Account < ActiveRecord::Base
  attr_accessible :name

  has_one :landscape

end
