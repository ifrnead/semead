require 'mercadopago.rb'

class PagamentosController < ApplicationController
  layout 'publico'
  skip_before_filter  :verify_authenticity_token

  def notificar
    mp = MercadoPago.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)
    mp.sandbox_mode(true) if Config.dev?

    if params[:id] != '12345'
      if params[:type] == 'payment'
        pagamento = Pagamento.find(params[:pagamento_id])
        pagamento.update_attribute(:situacao, Pagamento::SITUACOES[:approved])
        pagamento.participante.update_attribute(:pago, true)
      end
    end

    render nothing: true, status: 200
  end

  def processando
  end

  def aprovado
  end

  def falhou
  end
end
