class Project < ActiveRecord::Base
  attr_accessible :description, :name, :content
  
  belongs_to :user
end
