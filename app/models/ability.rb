class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :administrador
      can :manage, Publication
    elsif user.has_role? :enterprise
      can :manage, Publication
    else
      can :manage, Publication
    end      
  end
end
