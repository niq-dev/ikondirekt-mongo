module Abilities
  class StaffAbility < UserAbility
    def initialize(user)
      user ||= User.new
      if user.is_a? Staff
        can :manage, Staff, :company => user.company
        can :manage, Branch, :company => user.company
        can :manage, Reply, :company => user.company
        can :manage, Enquiry
      end
    end
  end
end