module NotesHelper
  def permission(note)
    if current_user == note.user
      "mine"
    else
      note.shares.find_by(user: current_user).permission
    end
  end
end