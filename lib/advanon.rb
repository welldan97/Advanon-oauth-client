require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Advanon < OmniAuth::Strategies::OAuth2
      option :name, :advanon
      option :client_options, {
        site:          'http://localhost:4000', # this should be changed to a real Advanon url
        authorize_path: '/oauth/authorize'
      }

      uid {
        raw_info['id']
      }

      info do
        {enabled: raw_info['enabled']}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/accounts/user').parsed # this path is (likely) temporary and just provided for the proof of concept, please don't rely on it too much
      end
    end
  end
end
