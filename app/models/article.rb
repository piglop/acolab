class Article < ActiveRecord::Base
  attr_accessible :content, :description, :title
  
  has_paper_trail
end
