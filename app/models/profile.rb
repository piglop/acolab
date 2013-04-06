class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :projects, :skills, :wishes
  
  has_paper_trail
end
