class SharePolicy < ApplicationPolicy
  def create?
    user == record.note.user
  end

  def destroy?
    create?
  end
end