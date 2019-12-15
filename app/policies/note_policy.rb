class NotePolicy < ApplicationPolicy
  def create?
    user.present?
  end
end