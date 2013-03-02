class User < ActiveRecord::Base
  rolify
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  
  has_many :projects, foreign_key: "author_id", inverse_of: :author
  
  def self.contributable(project)
    scoped.where("id != ?", project.author_id)
  end
  
  def display_name
    anonymous? ? I18n.t("anonymous", id: id) : name
  end
  
  def anonymous?
    name.blank?
  end
end
