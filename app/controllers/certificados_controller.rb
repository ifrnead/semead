class CertificadosController < ApplicationController
  before_action :auth_required

  def index
    authorize! :index, Certificado
    @certificados = current_user.certificados
  end

  def new
    authorize! :new, Certificado
    @certificado = Certificado.new
  end

  def create
    authorize! :new, Certificado
    @certificado = Certificado.new(certificado_params)
    if @certificado.save
      redirect_to certificado_path(@certificado, format: :pdf)
    else
      render :new
    end
  end

  def show
    @certificado = Certificado.find(params[:id])
    authorize! :show, @certificado

    if @certificado.usuario.participante? and (not @certificado.usuario.autenticavel.respondeu_questionario?)
      redirect_to Config.instance.url_questionario_avaliacao
    else
      respond_to do |format|
        format.pdf do
          render pdf: 'certificado',
                 layout: 'certificado',
                 orientation: 'Landscape',
                 page_size: 'A4',
                 background: true,
                 lowquality: false,
                 grayscale: false,
                 no_background: false,
                 show_as_html: params.key?('debug'),
                 margin: {
                   top: 0, bottom: 0, left: 0, right: 0
                 }
        end
      end
    end
  end

  private

  def certificado_params
    params.require(:certificado).permit(:titulo, :usuario_id, :texto)
  end
end
