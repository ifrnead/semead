require 'mercadopago.rb'

class PagamentosController < ApplicationController
  layout 'publico'
  skip_before_filter  :verify_authenticity_token

  def notificar
    mp = MercadoPago.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)

    if params[:id] != '12345'
      if params[:topic] == 'payment'
        pagamento = Pagamento.find(params[:pagamento_id])
        notification = mp.get("/collections/notifications/#{params[:id]}")
        pagamento.atualizar_situacao(notification['response']['collection']['status'])
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
