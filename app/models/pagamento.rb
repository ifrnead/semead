require 'mercadopago.rb'

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
    mp = MercadoPago.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)

    pagamento = Pagamento.create(participante: participante)

    if Config.dev?
      base_url = "http://200.137.2.164"
    else
      base_url = "http://eventos.ifrn.edu.br/semead"
    end

    preference_data = {
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
        pending: (base_url + "/pagamentos/processando"),
        success: (base_url + "/pagamentos/aprovado"),
        failure: (base_url + "/pagamentos/falhou")
      },
      expires: true,
      expiration_date_to: "#{pagamento.prazo.to_s}T23:59:59.999-03:00",
      notification_url: (base_url + "/pagamentos/#{pagamento.id}/notificar")
    }

    preference = mp.create_preference(preference_data)
    pagamento.update_attributes(json: preference, expira_em: pagamento.prazo, mercado_pago_id: preference['response']['id'], init_point: preference['response']['init_point'], sandbox_init_point: preference['response']['sandbox_init_point'])

    return pagamento
  end

  def atualizar_situacao(situacao)
    case situacao
      when 'pending'
        PagamentoMailer.pendente(self.participante).deliver_now
      when 'approved'
        self.participante.update_attribute(:pago, true)
        PagamentoMailer.aprovado(self.participante).deliver_now
      when 'in_process'
        PagamentoMailer.em_processamento(self.participante).deliver_now
      when 'in_mediation'
        # PagamentoMailer.em_medicacao(self.participante).deliver_now
      when 'rejected'
        PagamentoMailer.rejeitado(self.participante).deliver_now
      when 'cancelled'
        PagamentoMailer.cancelado(self.participante).deliver_now
      when 'refunded'
        PagamentoMailer.devolvido(self.participante).deliver_now
      when 'charged_back'
        PagamentoMailer.devolvido(self.participante).deliver_now
    end
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
