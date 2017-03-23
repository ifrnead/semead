require 'spec_helper'
require 'rails_helper'

describe Participante do
  it { expect validate_presence_of(:pais_id) }
  it { expect validate_presence_of(:cidade_id) }
  it { expect validate_uniqueness_of(:documento) }
  it { expect validate_presence_of(:necessidades_especiais) }
end
