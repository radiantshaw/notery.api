class ApplicationController < ActionController::API
  include Pundit
  include Authenticable

  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index

  rescue_from Pundit::NotAuthorizedError, with: :unauthorized

  private

  def unauthorized
    render :unauthorized, status: :unprocessable_entity
  end
end
