class Ability
  include CanCan::Ability

    #def initialize(user)
    #user ||= User.new # guest user (not logged in)
     #   if user.has_role? :admin
      
      #    can :manage, :all
       # end
    #end

    def initialize(user)
          user ||= User.new # guest user (not logged in)
        if user.has_role? :admin
              can :manage, :all
            elsif user.has_role? :secretaria
              can [:create, :update, :show], :all
           elsif user.has_role? :tecnico
              can [:show], :all
           elsif user.has_role? :cliente
            can :show, :all
            else
         can :show, :all
        end
    end
end
