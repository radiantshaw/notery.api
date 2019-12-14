module ApplicationHelper
  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end
end