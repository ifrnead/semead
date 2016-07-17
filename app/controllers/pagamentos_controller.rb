class PagamentosController < ApplicationController
  layout 'publico'
  skip_before_filter  :verify_authenticity_token

  def notificar
    mp_client = MercadoPago::Client.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)
    mp_client.sandbox_mode(true) if Config.dev?

    if params[:id] != '12345'
      notification = mp_client.notification(params[:id])
      puts notification.inspect
      pagamento = Pagamento.find(notification['collection']['external_reference'])
      pagamento.update_attribute(:situacao, notification['collection']['status'])

      if notification[:status] == 'approved'
        pagamento.participante.update_attribute(:pago, true)
        ParticipanteMailer.pagamento_aprovado(pagamento.participante).deliver_now
      elsif notification[:status] == 'in_process'
        ParticipanteMailer.pagamento_em_processamento(pagamento.participante).deliver_now
      elsif notification[:status] == 'pending'
        ParticipanteMailer.pagamento_pendente(pagamento.participante).deliver_now
      elsif notification[:status] == 'rejected'
        ParticipanteMailer.pagamento_rejeitado(pagamento.participante).deliver_now
      elsif notification[:status] == 'cancelled'
        ParticipanteMailer.pagamento_cancelado(pagamento.participante).deliver_now
      else
        ParticipanteMailer.pagamento_devolvido(pagamento.participante).deliver_now
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
