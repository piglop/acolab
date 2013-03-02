class Article < ActiveRecord::Base
  attr_accessible :content, :description, :title
end
