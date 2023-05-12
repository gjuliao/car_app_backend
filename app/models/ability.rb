class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    # this is abitilites for anonymous user

    can :read, Car

    return unless user.persisted?

    # ok, now we know that this user is logged in and can define common abilities
    puts 'User'
    can :read_user_reservations, Array do |arr|
      aux = arr.all? { |el| can?(:read, el) }
      puts "hola: #{aux}"
      aux
    end
    can :manage, Reservation, user_id: user.id
    
    can :read, Car

    return unless user.admin?

    # and after it we can define abilities for different admins

    can :manage, :all
  end
end
