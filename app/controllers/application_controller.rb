class ApplicationController < ActionController::API
  include Authenticable

  private

  delegate :current_user, to: :helpers
end
