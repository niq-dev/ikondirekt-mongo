module Abilities
  class CustomerAbility < UserAbility
    def initialize(user)
      user ||= User.new

    end
  end
end