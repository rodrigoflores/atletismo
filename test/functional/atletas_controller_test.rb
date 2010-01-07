require 'test_helper'

class AtletasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atletas)
  end

  test "should get new" do
    get :new, :atleta_id => 1
    assert_response :success
  end

  test "should create atleta" do
    assert_difference('Atleta.count') do
      post :create, :atleta => { }
    end

    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test "should show atleta" do
    get :show, :id => atletas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => atletas(:one).id
    assert_response :success
  end

  test "should update atleta" do
    put :update, :id => atletas(:one).id, :atleta => { }
    assert_redirected_to atleta_path(assigns(:atleta))
  end

  test "should destroy atleta" do
    assert_difference('Atleta.count', -1) do
      delete :destroy, :id => atletas(:one).id
    end

    assert_redirected_to atletas_path
  end
end
