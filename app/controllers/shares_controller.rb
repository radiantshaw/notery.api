class SharesController < ApplicationController
  before_action :authenticate_user!

  def create
    note = Note.find(share_params[:note][:id])
    user = User.find_by(email: share_params[:user][:email])

    head :unprocessable_entity unless user.present? && current_user != user

    @share = note.share(user, share_params[:user][:permission])
    authorize(@share)

    unless @share && @share.save
      head :unprocessable_entity
    end
  end

  def destroy
    @share = Share.find(params[:id])
    authorize(@share)

    unless @share.destroy
      head :unprocessable_entity
    end
  end

  private

  def share_params
    params.require(:share).permit(note: [:id], user: [:email, :permission])
  end
end