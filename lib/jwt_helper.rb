class JWTHelper
  class << self
    def encode(payload)
      JWT.encode(payload, key, algorithm)
    end

    def decode(token)
      JWT.decode(token, key, true, algorithm: algorithm)[0]
    end

    private

    def algorithm
      'HS256'
    end

    def key
      Rails.application.credentials.json_web_token_key
    end
  end
end