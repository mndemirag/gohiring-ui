# frozen_string_literal: true

require 'jwt'

module Auth
  # Takes care of encoding/decoding a json web token.
  class Jwt
    ALGORITHM = 'HS256'

    # Returns a token to be used for accessing the Common API.
    def self.encode
      payload = {
        sub: ENV.fetch('JWT_PUBLIC_KEY')
      }

      JWT.encode(
        payload,
        ENV.fetch('JWT_SECRET_KEY'),
        ALGORITHM
      )
    end

    def self.build(string)
      new(string)
    end

    def initialize(string)
      @token = decode(string)
    end


    def valid?
      public_key == ENV.fetch('JWT_PUBLIC_KEY')
    end

    private
    attr_reader :token

    def decode(token)
      JWT.decode(
        token,
        ENV.fetch('JWT_SECRET_KEY'),
        true, # verify the signature
        algorithm: ALGORITHM
      ).first
    rescue JWT::DecodeError
      {}
    end

    def public_key
      token['sub']
    end
  end
end
