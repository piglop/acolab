class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :projects, :skills, :wishes
end
