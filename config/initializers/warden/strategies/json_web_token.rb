require 'jwt_helper'

module Warden
  module Strategies
    class JsonWebToken < Base
      def valid?
        token.present?
      end

      def authenticate!
        if record.present?
          success!(record)
        else
          fail
        end
      end

      private

      def record
        @record ||= User.find(user_id)
      end

      def user_id
        JWTHelper.decode(token)["user_id"]
      end

      def token
        @token ||= header.match(/Bearer\s(.+)/).captures[0]
      end

      def header
        request.get_header("HTTP_AUTHORIZATION").to_s
      end
    end
  end
end

Warden::Strategies.add(:json_web_token, Warden::Strategies::JsonWebToken)
