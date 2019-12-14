module Warden
  module Strategies
    class Password < Base
      def valid?
        email.present? && password.present?
      end

      def authenticate!
        if record.present? && record.authenticate(password)
          success!(record)
        else
          fail
        end
      end

      private

      def record
        @record ||= User.find_by(email: email)
      end

      def email
        params["user"]["email"]
      end

      def password
        params["user"]["password"]
      end
    end
  end
end

Warden::Strategies.add(:password, Warden::Strategies::Password)