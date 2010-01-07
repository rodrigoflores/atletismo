require 'test_helper'

class ProvasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provas)
  end

  test "should get new" do
    get :new, :atleta => "1"
    assert_response :success
  end

  test "should create prova" do
    assert_difference('Prova.count') do
      post :create, :prova => { }, :atleta => "1"
    end
    atleta = 1
    #assert_redirected_to atleta_path(atleta)
  end

  test "should show prova" do
    get :show, :id => provas(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => provas(:one).to_param
    assert_response :success
  end

  test "should update prova" do
    put :update, :id => provas(:one).to_param, :prova => { }
    assert_redirected_to prova_path(assigns(:prova))
  end

  test "should destroy prova" do
    assert_difference('Prova.count', -1) do
      delete :destroy, :id => provas(:one).to_param
    end

    assert_redirected_to provas_path
  end
end
