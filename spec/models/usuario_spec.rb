require 'spec_helper'
require 'rails_helper'

describe Usuario do
  it { expect validate_presence_of(:nome) }
  it { expect validate_presence_of(:email) }
  it { expect validate_presence_of(:password) }
  it { expect validate_confirmation_of(:password) }
  it { expect have_secure_password }

  describe "creation" do
    context 'valid attributes' do
      it 'expect to be valid' do
        usuario = FactoryGirl.build(:usuario)
        expect(usuario).to be_valid
      end
    end

    context "invalid attributes" do
      it 'expect to be not valid' do
        usuario = FactoryGirl.build(:usuario, email: '')
        expect(usuario).not_to be_valid
      end
    end
  end
end
