json.note do
  json.id @note.id
  json.content @note.content
  json.permission permission(@note)
  json.contributors(@note.contributors) do |contributor|
    json.id contributor.id
    json.email contributor.email
  end
  json.readers(@note.readers) do |reader|
    json.id reader.id
    json.email reader.email
  end
end