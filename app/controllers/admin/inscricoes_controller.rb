class Admin::InscricoesController < ApplicationController

  def create
    authorize! :avulsa, Inscricao
    inscricao = Inscricao.new(inscricao_params)
    if inscricao.save(validate: false)
      redirect_to admin_minicurso_path(inscricao.minicurso), notice: 'Inscrição realizada com sucesso!'
    else
      redirect_to admin_minicurso_path(inscricao.minicurso), alert: 'Falha na inscrição!'
    end
  end

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

  private

  def inscricao_params
    params.require(:inscricao).permit(:participante_id, :minicurso_id)
  end

end
