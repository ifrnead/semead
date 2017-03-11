class CertificadosController < ApplicationController

  def index
    authorize! :index, Certificado
  end

  def show
    @certificado = Certificado.find(params[:id])
    authorize! :show, @certificado

    respond_to do |format|
      format.html do
        render 'show', layout: 'certificado'
      end
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
