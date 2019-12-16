json.user do
  json.email current_user.email
  json.token tokenize(current_user)
end