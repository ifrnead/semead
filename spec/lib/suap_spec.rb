require 'rails_helper'
require 'suap'

describe SUAP::API do

  it 'successfully authenticate' do
    token = SUAP::API.authenticate(username: Rails.application.secrets.suap_username, password: Rails.application.secrets.suap_password)

    expect(token).to_not be_nil
    expect(token).to be_an_instance_of(String)
  end

  it 'unsuccessfully authenticate' do
    expect {
      SUAP::API.authenticate(username: 'username', password: 'password')
    }.to raise_error RestClient::BadRequest
  end

end
