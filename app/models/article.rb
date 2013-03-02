class Article < ActiveRecord::Base
  attr_accessible :content, :description, :title, :position
  
  has_paper_trail
end
