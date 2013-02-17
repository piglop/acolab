class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user and user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      cannot :read, User
      can :update, Project do |project|
        user.has_role? :editor, project or
          user.has_role? :manager, project
      end
      can :destroy, Project do |project|
        user.has_role? :manager, project
      end
      can :create, Project
    end
  end
end
