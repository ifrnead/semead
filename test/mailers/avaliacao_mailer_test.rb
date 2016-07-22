require 'test_helper'

class AvaliacaoMailerTest < ActionMailer::TestCase
  test "avaliacao_atribuida" do
    mail = AvaliacaoMailer.avaliacao_atribuida
    assert_equal "Avaliacao atribuida", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "avaliacao_conflitante" do
    mail = AvaliacaoMailer.avaliacao_conflitante
    assert_equal "Avaliacao conflitante", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
