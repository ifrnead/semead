class Admin::OrganizadoresController < ApplicationController
  load_and_authorize_resource
  before_action :set_organizador, only: [:show, :edit, :update, :destroy]

  def show
    authorize! :see, Organizador
  end

  def index
    authorize! :index, Organizador
    @organizadores = Organizador.all
  end

  def new
    authorize! :create, Organizador
    @organizador = Organizador.new
    @organizador.usuario = Usuario.new
  end

  def create
    authorize! :create, Organizador
    @organizador = Organizador.new(organizador_params)

    respond_to do |format|
      if @organizador.save
        format.html { redirect_to admin_organizadores_path, notice: 'Organizador cadastrado com sucesso!' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    authorize! :update, Organizador
  end

  def update
    authorize! :update, Organizador
    respond_to do |format|
      if @organizador.update_attributes(organizador_params)
        format.html { redirect_to admin_organizadores_path, notice: 'Organizador atualizado com sucesso!' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    authorize! :destroy, Organizador
    @organizador.destroy

    respond_to do |format|
      format.html { redirect_to admin_organizadores_path, notice: 'Organizador excluído com sucesso!' }
    end
  end

  private

    def set_organizador
      @organizador = Organizador.find(params[:id])
    end

    def organizador_params
      params.require(:organizador).permit(:nome, usuario_attributes: [ :email, :password, :password_confirmation ])
    end
end
