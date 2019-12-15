class SharePolicy < ApplicationPolicy
  def create?
    user == record.note.user
  end
end