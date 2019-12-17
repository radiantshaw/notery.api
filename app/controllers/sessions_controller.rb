class SessionsController < ApplicationController
  before_action :authenticate_user!
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  def create
    unless current_user.present?
      head :unprocessable_entity
    end
  end
end