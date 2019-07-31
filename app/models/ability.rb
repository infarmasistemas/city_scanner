class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
    else
      can :manage, :dashboard
      can :manage, Contact, user_id: user.id
      can :manage, Log, resource: {user_id: user.id}
      can :manage, Resource, user_id: user.id
    end
  end
end
