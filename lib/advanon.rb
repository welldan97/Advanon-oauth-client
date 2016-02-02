require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Advanon < OmniAuth::Strategies::OAuth2
      option :name, :advanon
      option :client_options, {
        site:          'http://localhost:4000',
        authorize_path: '/oauth/authorize'
      }

      uid {
        raw_info['id']
      }

      info do
        {enabled: raw_info['enabled']}
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/accounts/user').parsed
      end
    end
  end
end
