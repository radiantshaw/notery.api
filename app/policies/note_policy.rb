class NotePolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user == record.user || record.contributors.include?(user)
  end

  def destroy?
    user == record.user
  end
end