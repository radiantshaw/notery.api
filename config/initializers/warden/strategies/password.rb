module Warden
  module Strategies
    class Password < Base
      def valid?
        email.present? && password.present?
      end

      def authenticate!
        if user.present? && user.authenticate(password)
          success!(user)
        else
          fail
        end
      end

      private

      def user
        @user ||= User.find_by(email: email)
      end

      def email
        params["email"]
      end

      def password
        params["password"]
      end
    end
  end
end

Warden::Strategies.add(:password, Warden::Strategies::Password)