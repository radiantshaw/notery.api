class SessionsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    unless current_user.present?
      head :unprocessable_entity
    end
  end
end