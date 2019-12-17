json.note do
  json.id @note.id
  json.content @note.content
  json.permission permission(@note)
  json.contributing(@note.contributing_shares) do |share|
    json.id share.id
    json.email share.user.email
  end
  json.reading(@note.reading_shares) do |share|
    json.id share.id
    json.email share.user.email
  end
end