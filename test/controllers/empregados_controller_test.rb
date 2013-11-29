require 'test_helper'

class EmpregadosControllerTest < ActionController::TestCase
  setup do
    @empregado = empregados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empregados)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empregado" do
    assert_difference('Empregado.count') do
      post :create, empregado: { departamento_id: @empregado.departamento_id, name: @empregado.name }
    end

    assert_redirected_to empregado_path(assigns(:empregado))
  end

  test "should show empregado" do
    get :show, id: @empregado
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empregado
    assert_response :success
  end

  test "should update empregado" do
    patch :update, id: @empregado, empregado: { departamento_id: @empregado.departamento_id, name: @empregado.name }
    assert_redirected_to empregado_path(assigns(:empregado))
  end

  test "should destroy empregado" do
    assert_difference('Empregado.count', -1) do
      delete :destroy, id: @empregado
    end

    assert_redirected_to empregados_path
  end
end
