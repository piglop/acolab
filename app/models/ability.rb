class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user and user.has_role? :admin
      can :manage, :all
    else
      can :read, Project
      can :update, Project do |project|
        user.has_role? :editor, project or
          user.has_role? :manager, project
      end
      can :destroy, Project do |project|
        user.has_role? :manager, project
      end
      can :create, Project

      can :read, Image do |image|
        user.has_role? :editor, image or
          user.has_role? :manager, image
      end
      can :update, Image do |image|
        user.has_role? :editor, image or
          user.has_role? :manager, image
      end
      can :destroy, Image do |image|
        user.has_role? :manager, image
      end
      can :create, Image
    end
  end
end
