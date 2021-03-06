class NotePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.joins(%{
        LEFT JOIN shares ON shares.note_id = notes.id
      }).where(%{
        notes.user_id = :user_id
        OR shares.user_id = :user_id
      }, user_id: user.id).distinct
    end
  end

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