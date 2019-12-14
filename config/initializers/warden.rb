Rails.application.config.middleware.use(Warden::Manager) do |manager|
  manager.default_strategies :json_web_token, :password
end
