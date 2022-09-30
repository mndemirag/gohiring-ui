# frozen_string_literal: true

require Rails.root.join('lib/auth/jwt')

module Api
  # Receives requests [create, update, delete] from the Common API.
  class PositionsController < ApplicationController
    before_action :authenticate

    def create
      position = Position.create!(CommonAPI::Mapper.call(attributes))

      render json: {
        data: { type: 'position-opening', links: { self: api_positions_url(position) } }
      }, status: 201, content_type: 'application/vnd.api+json'
    end

    private

    def attributes
      params.require(:data)['attributes']
    end

    def authenticate
      head 401 unless Auth::Jwt.build(auth_token).valid?
    end

    def auth_token
      request.headers['Authorization'].to_s.split(' ', 2).last
    end
  end
end
