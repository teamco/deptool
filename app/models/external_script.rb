class ExternalScript < ActiveRecord::Base
  attr_accessible :script

  belongs_to :app
end
