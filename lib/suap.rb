require 'rest-client'

module SUAP
  class API

    def self.authenticate(username:, password:)
      response = RestClient.post('https://suap.ifrn.edu.br/api/v2/autenticacao/token/',
        { "username": username, "password": password }.to_json,
        { content_type: :json, accept: :json }
        )
      return JSON.parse(response.body)["token"]
    end

  end
end
