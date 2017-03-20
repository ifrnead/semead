require 'spec_helper'
require 'rails_helper'

describe Usuario do
  it { expect validate_presence_of(:nome) }
  it { expect validate_presence_of(:email) }
  it { expect validate_presence_of(:password) }
  it { expect validate_confirmation_of(:password) }
  it { expect have_secure_password }
  it { expect belong_to :autenticavel }
  it { expect belong_to :perfil }
end
