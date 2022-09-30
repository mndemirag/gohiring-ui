# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Positions', type: :request do
  describe 'POST /positions' do
    subject(:post_request) do
      post api_positions_path, params: data, headers: headers
    end

    let(:public_key) { ENV.fetch('JWT_PUBLIC_KEY') }
    let(:secret_key) { ENV.fetch('JWT_SECRET_KEY') }
    let(:token) do
      JWT.encode( { sub: public_key }, secret_key, 'HS256')
    end
    let(:headers) do
      {
        'Content-Type' => 'application/vdn.api+json',
        Authorization: "Bearer #{token}"
      }
    end
    let(:data) { File.read('spec/fixtures/publication.json') }
    let(:attributes) { JSON.parse(data)['data']['attributes'] }

    it 'creates a new position' do
      expect { post_request }.to change { Position.count }.from(0).to(1)
    end

    it 'responds with a created status response' do
      post_request

      expect(response).to have_http_status(201)
    end

    it 'stores the reference, title, company name and update_uri' do
      post_request
      new_position = Position.take

      expect(new_position.reference).to eq(attributes.dig('UserArea', 'PostingID'))
      expect(new_position.title).to eq(attributes['PositionTitle'])
      expect(new_position.company_name).to eq(attributes['OrganizationName'])
      expect(new_position.update_uri).to eq(attributes.dig('UserArea', 'PostingURI'))
    end

    context 'when the Auth token is invalid' do
      let(:token) do
        JWT.encode(
          { sub: SecureRandom.uuid },
          'some wrong secret key',
          'HS256'
        )
      end

      it 'responds with an unauthorized response' do
        post_request

        expect(response).to have_http_status(401)
      end

      it 'does not create a position' do
        expect { post_request }.to_not(change { Position.count })
      end
    end
  end

 describe 'PATCH /positions/:id' do
   it 'is not implemented'
 end

 describe 'DELETE /positions/:id' do
   it 'is not implemented'
 end
end
