json.notes(@notes) do |note|
  json.id note.id
  json.content note.content
  json.permission permission(note)
end