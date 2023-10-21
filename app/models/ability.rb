# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.role == 'admin'
    can :delete, Comment
  end
end
