class Project < ActiveRecord::Base
  attr_accessible :description, :name, :content, :contributor_ids
  
  belongs_to :author, class_name: "User"
  has_many :contributor_assignations, as: :target, inverse_of: :target
  has_many :contributors, through: :contributor_assignations, source: :user
  
  has_paper_trail
end
