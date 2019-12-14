module Authenticable
  def authenticate_user!
    request.env['warden'].authenticate
  end
end