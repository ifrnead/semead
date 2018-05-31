require 'mercadopago.rb'

class PagamentosController < ApplicationController
  layout 'publico'
  skip_before_action  :verify_authenticity_token

  def notificar
    mp = MercadoPago.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)

    if params[:id] != '12345'
      pagamento = Pagamento.find(params[:pagamento_id])
      if params[:topic] == 'payment'
        payment = mp.get("/collections/notifications/#{params[:id]}")
        pagamento.atualizar_situacao(payment['response']['collection']['status'])
        pagamento.update_attributes(mp_payment: payment)
      end
      if params[:topic] == 'merchant_order'
        merchant_order = mp.get("/merchant_orders/#{params[:id]}")
        pagamento.update_attributes(mp_merchant_order: merchant_order)
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
