class PagamentosController < ApplicationController
  def notificar
    mp_client = MercadoPago::Client.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)
    mp_client.sandbox_mode(true) if Rails.env.development?

    notification = mp_client.notification(params[:id])
    pagamento = Pagamento.find(notification[:collection][:external_reference])
    pagamento.update_attribute(:situacao, notification[:collection][:status])

    if notification[:collection][:status] == 'approved'
      pagamento.participante.update_attribute(:pago, true)
    end

    render status: 200
  end
end
