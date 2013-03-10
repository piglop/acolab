class Workshop < ActiveRecord::Base
  attr_accessible :content, :description, :name, :state
end
