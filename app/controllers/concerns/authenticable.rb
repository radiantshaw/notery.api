module Authenticable
  def authenticate_user!
    warden.authenticate
  end

  private

  delegate :warden, :current_user, to: :helpers
end