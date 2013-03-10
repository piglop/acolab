class Workshop < ActiveRecord::Base
  attr_accessible :content, :description, :name, :state
  
  STATES = %w( considered working )

  has_paper_trail
end
