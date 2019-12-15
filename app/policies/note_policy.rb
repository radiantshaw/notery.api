class NotePolicy < ApplicationPolicy
  def show?
    user == record.user || record.interactors.include?(user)
  end

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