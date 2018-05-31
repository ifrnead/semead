require 'mercadopago.rb'

class Pagamento < ApplicationRecord
  belongs_to :participante

  validates :participante, presence: true

  before_create :definir_situacao, :definir_prazo, :definir_valor

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

    if Rails.env.development?
      base_url = "http://semead.jalerson.ultrahook.com/semead"
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
        email: pagamento.participante.email,
        identification: {
          type: 'CPF',
          number: pagamento.participante.documento
        }
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
    pagamento.update_attributes(mp_preference: preference, prazo: pagamento.prazo, mp_id: preference['response']['id'], mp_init_point: preference['response']['init_point'])

    return pagamento
  end

  def atualizar_situacao(situacao)
    self.update_attribute(:situacao, situacao)
    case situacao
      when 'pending'
        PagamentoMailer.pendente(self.participante).deliver_now
      when 'approved'
        self.participante.update_attribute(:pago, true)
        PagamentoMailer.aprovado(self.participante).deliver_now
      when 'in_process'
        PagamentoMailer.em_processamento(self.participante).deliver_now
      when 'in_mediation'
        PagamentoMailer.em_medicacao(self.participante).deliver_now
      when 'rejected'
        PagamentoMailer.rejeitado(self.participante).deliver_now
      when 'cancelled'
        PagamentoMailer.cancelado(self.participante).deliver_now
      when 'refunded'
        self.participante.update_attribute(:pago, false)
        PagamentoMailer.devolvido(self.participante).deliver_now
      when 'charged_back'
        self.participante.update_attribute(:pago, false)
        PagamentoMailer.devolvido(self.participante).deliver_now
    end
  end

  def definir_situacao
    self.situacao = 'pending'
  end

  def definir_prazo
    self.prazo = Date.today + Config.instance.prazo_pagamento
  end

  def definir_valor
    if Config.instance.dev?
      self.valor = 1
      return
    end

    if Date.today <= Date.new(2017, 2, 28)
      if self.participante.tipo?('estudante')
        self.valor = 80
        return
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        self.valor = 100
        return
      else
        self.valor = 120
        return
      end
    elsif Date.today <= Date.new(2017, 4, 30)
      if self.participante.tipo?('estudante')
        self.valor = 100
        return
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        self.valor = 120
        return
      else
        self.valor = 140
        return
      end
    else
      if self.participante.tipo?('estudante')
        self.valor = 120
        return
      elsif self.participante.tipo?('professor_ensino_superior_posgraduacao') or self.participante.tipo?('professor_educacao_basica') or self.participante.tipo?('profissional_educacao')
        self.valor = 140
        return
      else
        self.valor = 160
        return
      end
    end
  end

  def payment(key)
    eval(self.mp_payment)['response']['collection'][key]
  end

  def merchant_order(key)
    eval(self.mp_merchant_order)['response'][key]
  end

end
