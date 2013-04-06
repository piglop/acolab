class Workshop < ActiveRecord::Base
  attr_accessible :content, :description, :name, :state
  
  STATES = %w( considered to_fund working abandoned )

  has_paper_trail
  
  def to_label
    name.presence || I18n.t("workshop_without_name")
  end
end
