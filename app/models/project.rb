class Project < ActiveRecord::Base
  attr_accessible :description, :name, :content
  
  belongs_to :author, class_name: "User"
  
  has_paper_trail
end
