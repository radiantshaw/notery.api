json.user do
  json.id @user.id
  json.email @user.email
  json.token tokenize(@user)
end