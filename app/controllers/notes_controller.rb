class NotesController < ApplicationController
  before_action :authenticate_user!

  def create
    @note = Note.new(note_params)
    authorize(@note)
    @note.user = current_user

    unless @note.save
      head :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])
    authorize(@note)
    @note.content = note_params[:content]

    unless @note.save
      head :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:id, :content)
  end
end