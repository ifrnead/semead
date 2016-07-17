class Pagamento < ActiveRecord::Base
  belongs_to :participante

  validates :participante, presence: true

  before_create :definir_situacao

  SITUACOES = {
    :pending => 'Pendente',
    :approved => 'Aprovado',
    :in_process => 'Em processamento',
    :in_mediation => 'Em mediação',
    :rejected => 'Negado',
    :cancelled => 'Cancelado',
    :refunded  => 'Devolvido',
    :charged_back => 'Devolvido'
  }

  def self.gerar(participante)
    mp_client = MercadoPago::Client.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)
    mp_client.sandbox_mode(true) if Config.dev?

    pagamento = Pagamento.create(participante: participante)

    if Config.dev?
      base_url = "http://200.137.2.164"
    else
      base_url = "http://eventos.ifrn.edu.br/semead"
    end

    payment_request = {
      external_reference: pagamento.id,
      items: [
        {
          id: "inscricao",
          title: "Inscrição da III SEMEAD/IFRN-EaD",
          description: "Inscrição para #{participante.nome} até #{pagamento.prazo.strftime('%d/%m/%Y')}",
          currency_id: "BRL",
          quantity: 1,
          unit_price: pagamento.valor
        }
      ],
      payer: {
        name: pagamento.participante.nome,
        email: pagamento.participante.email
      },
      back_urls: {
        pending: (base_url + "/pagamentos/processamento"),
        success: (base_url + "/pagamentos/aprovado"),
        failure: (base_url + "/pagamentos/falhou")
      },
      expires: true,
      expiration_date_to: "#{pagamento.prazo.to_s}T23:59:59.999-03:00",
      notification_url: (base_url + "/pagamentos/notificar")
    }

    payment_response = mp_client.create_preference(payment_request)
    pagamento.update_attributes(json: payment_response, expira_em: pagamento.prazo, mercado_pago_id: payment_response['id'], init_point: payment_response['init_point'], sandbox_init_point: payment_response['sandbox_init_point'])

    return pagamento
  end

  def definir_situacao
    self.situacao = 'pending'
  end

  def prazo
    if Date.today <= Date.new(2016, 8, 30)
      return Date.new(2016, 8, 30)
    elsif Date.today <= Date.new(2016, 10, 31)
      return Date.new(2016, 10, 31)
    else
      return Date.new(2016, 11, 29)
    end
  end

  def valor
    return 1 if Config.dev?

    if self.prazo == Date.new(2016, 8, 30)
      if self.participante.tipo?('estudante')
        return 80
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        return 100
      else
        return 120
      end
    elsif self.prazo == Date.new(2016, 10, 31)
      if self.participante.tipo?('estudante')
        return 100
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        return 120
      else
        return 140
      end
    else
      if self.participante.tipo?('estudante')
        return 120
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        return 140
      else
        return 160
      end
    end
  end

end
