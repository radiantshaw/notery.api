json.user do
  json.id current_user.id
  json.email current_user.email
  json.token tokenize(current_user)
end