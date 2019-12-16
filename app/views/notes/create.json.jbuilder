json.note do
  json.id @note.id
  json.content @note.content
  json.permission "mine"
end