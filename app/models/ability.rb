class Ability
  include CanCan::Ability

  def initialize(user)
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
    if user and user.has_role? :admin
      can :manage, :all
    else
      can :read,    Project
      can :history, Project
      
      can :read,    Article
      can :history, Article
      
      can :read,    Workshop
      can :history, Workshop
      
      can :read,    User
      
      if user
        can :create,  Project, author_id: user.id
        can :update,  Project, author_id: user.id
        can :update,  Project, contributor_assignations: {user_id: user.id}
        can :destroy, Project, author_id: user.id

        can :create,  Article
        can :update,  Article
        
        can :create,  Workshop
        can :update,  Workshop
        
        can :read,    Image, owner_id: user.id
        can :create,  Image, owner_id: user.id
        can :update,  Image, owner_id: user.id
        can :destroy, Image, owner_id: user.id
      end
    end
  end
end
