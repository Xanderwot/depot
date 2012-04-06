class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new       
        case user.role   
            when "admin"
                can :manage, [ Product, Order, User, Payment, Message, LineItem,
                               Image, Cart ]
                can :assign_role, User               
            when "user"
                can :read, [ Product, Payment, Message, Image ]
                can [ :create, :update ], LineItem
                can :create, Message
                can :destroy, LineItem, :cart_id => user.cart_id
                can :destroy, Message, :user_id => user.id
                can :manage, Order, :user_id => user.id
                can :manage, User, :id => user.id
                can :manage, Cart, :id => user.cart_id    
        end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
