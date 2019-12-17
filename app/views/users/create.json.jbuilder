json.user do
  json.email @user.email
  json.token tokenize(@user)
end