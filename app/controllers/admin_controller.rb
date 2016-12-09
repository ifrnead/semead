class AdminController < ApplicationController
  before_filter :auth_required

  def index
    if current_user.organizador?
      @trabalhos_avaliacao_pendente = current_user.autenticavel.trabalhos_avaliacao_pendente
    end
  end
end
