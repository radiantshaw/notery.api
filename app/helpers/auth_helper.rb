require 'jwt_helper'

module AuthHelper
  def tokenize(user)
    JWTHelper.encode({ user_id: user.id })
  end
end