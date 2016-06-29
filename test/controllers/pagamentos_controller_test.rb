require 'test_helper'

class PagamentosControllerTest < ActionController::TestCase
  test "should get notificar" do
    get :notificar
    assert_response :success
  end

end
