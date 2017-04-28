class Admin::InscricoesController < ApplicationController

  def destroy
    authorize! :destroy, Inscricao
    inscricao = Inscricao.find(params[:id])
    minicurso = inscricao.minicurso
    if inscricao.destroy
      redirect_to admin_minicurso_path(minicurso), notice: 'Inscrição excluída com sucesso!'
    else
      redirect_to admin_minicurso_path(minicurso), alert: 'Falha na exclusão da inscrição!'
    end
  end

end
