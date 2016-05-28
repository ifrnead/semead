require 'test_helper'

class ParticipantesControllerTest < ActionController::TestCase
  setup do
    @participante = participantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:participantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create participante" do
    assert_difference('Participante.count') do
      post :create, participante: { cidade_id: @participante.cidade_id, documento: @participante.documento, email: @participante.email, instituicao: @participante.instituicao, necessidades_especiais: @participante.necessidades_especiais, nome: @participante.nome, pais_id: @participante.pais_id, possui_necessidades_especiais: @participante.possui_necessidades_especiais, senha: @participante.senha, tipo_inscricao_id: @participante.tipo_inscricao_id, tipo_participante_id: @participante.tipo_participante_id }
    end

    assert_redirected_to participante_path(assigns(:participante))
  end

  test "should show participante" do
    get :show, id: @participante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @participante
    assert_response :success
  end

  test "should update participante" do
    patch :update, id: @participante, participante: { cidade_id: @participante.cidade_id, documento: @participante.documento, email: @participante.email, instituicao: @participante.instituicao, necessidades_especiais: @participante.necessidades_especiais, nome: @participante.nome, pais_id: @participante.pais_id, possui_necessidades_especiais: @participante.possui_necessidades_especiais, senha: @participante.senha, tipo_inscricao_id: @participante.tipo_inscricao_id, tipo_participante_id: @participante.tipo_participante_id }
    assert_redirected_to participante_path(assigns(:participante))
  end

  test "should destroy participante" do
    assert_difference('Participante.count', -1) do
      delete :destroy, id: @participante
    end

    assert_redirected_to participantes_path
  end
end
