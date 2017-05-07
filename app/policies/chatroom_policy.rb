class ChatroomPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    record.users.include?(user)
  end

  def create?
    true
  end
end
