require 'test_helper'

class TrabalhosControllerTest < ActionController::TestCase
  setup do
    @trabalho = trabalhos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trabalhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create trabalho" do
    assert_difference('Trabalho.count') do
      post :create, trabalho: { linha_id: @trabalho.linha_id, participante_id: @trabalho.participante_id, resumo: @trabalho.resumo, tipo_trabalho_id: @trabalho.tipo_trabalho_id, titulo: @trabalho.titulo }
    end

    assert_redirected_to trabalho_path(assigns(:trabalho))
  end

  test "should show trabalho" do
    get :show, id: @trabalho
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trabalho
    assert_response :success
  end

  test "should update trabalho" do
    patch :update, id: @trabalho, trabalho: { linha_id: @trabalho.linha_id, participante_id: @trabalho.participante_id, resumo: @trabalho.resumo, tipo_trabalho_id: @trabalho.tipo_trabalho_id, titulo: @trabalho.titulo }
    assert_redirected_to trabalho_path(assigns(:trabalho))
  end

  test "should destroy trabalho" do
    assert_difference('Trabalho.count', -1) do
      delete :destroy, id: @trabalho
    end

    assert_redirected_to trabalhos_path
  end
end
