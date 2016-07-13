class PagamentosController < ApplicationController
  layout 'publico'

  def notificar
    mp_client = MercadoPago::Client.new(Rails.application.secrets.mercado_pago_client_id, Rails.application.secrets.mercado_pago_client_secret)
    mp_client.sandbox_mode(true) if Config.dev?

    notification = mp_client.notification(params[:id])
    pagamento = Pagamento.find(notification[:collection][:external_reference])
    pagamento.update_attribute(:situacao, notification[:collection][:status])

    if notification[:collection][:status] == 'approved'
      pagamento.participante.update_attribute(:pago, true)
      ParticipanteMailer.pagamento_aprovado(pagamento.participante).deliver_now
    elsif notification[:collection][:status] == 'in_process'
      ParticipanteMailer.pagamento_em_processamento(pagamento.participante).deliver_now
    elsif notification[:collection][:status] == 'pending'
      ParticipanteMailer.pagamento_pendente(pagamento.participante).deliver_now
    elsif notification[:collection][:status] == 'rejected'
      ParticipanteMailer.pagamento_rejeitado(pagamento.participante).deliver_now
    elsif notification[:collection][:status] == 'cancelled'
      ParticipanteMailer.pagamento_cancelado(pagamento.participante).deliver_now
    else
      ParticipanteMailer.pagamento_devolvido(pagamento.participante).deliver_now
    end

    render status: 200
  end

  def processando
  end

  def aprovado
  end

  def falhou
  end
end
