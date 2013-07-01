require 'test_helper'

class MedicalSpecializationsControllerTest < ActionController::TestCase
  setup do
    @medical_specialization = medical_specializations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_specializations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_specialization" do
    assert_difference('MedicalSpecialization.count') do
      post :create, medical_specialization: { name: @medical_specialization.name }
    end

    assert_redirected_to medical_specialization_path(assigns(:medical_specialization))
  end

  test "should show medical_specialization" do
    get :show, id: @medical_specialization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_specialization
    assert_response :success
  end

  test "should update medical_specialization" do
    put :update, id: @medical_specialization, medical_specialization: { name: @medical_specialization.name }
    assert_redirected_to medical_specialization_path(assigns(:medical_specialization))
  end

  test "should destroy medical_specialization" do
    assert_difference('MedicalSpecialization.count', -1) do
      delete :destroy, id: @medical_specialization
    end

    assert_redirected_to medical_specializations_path
  end
end
