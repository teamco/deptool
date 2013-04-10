class Account < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :landscape_id

  belongs_to :landscape

end
