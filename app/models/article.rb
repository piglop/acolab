class Article < ActiveRecord::Base
  attr_accessible :content, :description, :title, :position
  
  has_paper_trail
  
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  def to_label
    title.presence || I18n.t("article_without_title")
  end
end
