class SessionsController < ApplicationController
  def create
    @user = request.env['warden'].authenticate

    unless @user.present?
      head :unprocessable_entity
    end
  end
end