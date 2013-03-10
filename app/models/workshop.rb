class Workshop < ActiveRecord::Base
  attr_accessible :content, :description, :name, :state
  
  STATES = %w( considered to_fund working abandoned )

  has_paper_trail
end
