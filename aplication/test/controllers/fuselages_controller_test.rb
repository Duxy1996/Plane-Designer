require 'test_helper'

class FuselagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fuselage = fuselages(:one)
  end

  test "should get index" do
    get fuselages_url
    assert_response :success
  end

  test "should get new" do
    get new_fuselage_url
    assert_response :success
  end

  test "should create fuselage" do
    assert_difference('Fuselage.count') do
      post fuselages_url, params: { fuselage: { description: @fuselage.description, name: @fuselage.name } }
    end

    assert_redirected_to fuselage_url(Fuselage.last)
  end

  test "should show fuselage" do
    get fuselage_url(@fuselage)
    assert_response :success
  end

  test "should get edit" do
    get edit_fuselage_url(@fuselage)
    assert_response :success
  end

  test "should update fuselage" do
    patch fuselage_url(@fuselage), params: { fuselage: { description: @fuselage.description, name: @fuselage.name } }
    assert_redirected_to fuselage_url(@fuselage)
  end

  test "should destroy fuselage" do
    assert_difference('Fuselage.count', -1) do
      delete fuselage_url(@fuselage)
    end

    assert_redirected_to fuselages_url
  end
end
