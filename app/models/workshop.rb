class Workshop < ActiveRecord::Base
  attr_accessible :content, :description, :name, :state
  
  STATES = %w( considered working abandoned )

  has_paper_trail
end
