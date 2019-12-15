class NotesController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    @note = Note.new(note_params)
    authorize(@note)
    @note.user = current_user

    unless @note.save
      head :unprocessable_entity
    end
  end

  private

  def note_params
    params.require("note").permit("content")
  end
end