class ContributorAssignation < ActiveRecord::Base
  belongs_to :user
  belongs_to :target, polymorphic: true
  # attr_accessible :title, :body
end
