class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user and user.has_role? :admin
      can :manage, :all
    else
      can :read,    Project
      can :create,  Project, author_id: user.id
      can :update,  Project, author_id: user.id
      can :destroy, Project, author_id: user.id

      can :read,    Image, owner_id: user.id
      can :create,  Image, owner_id: user.id
      can :update,  Image, owner_id: user.id
      can :destroy, Image, owner_id: user.id
    end
  end
end
