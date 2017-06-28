require 'test_helper'

class WingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wing = wings(:one)
  end

  test "should get index" do
    get wings_url
    assert_response :success
  end

  test "should get new" do
    get new_wing_url
    assert_response :success
  end

  test "should create wing" do
    assert_difference('Wing.count') do
      post wings_url, params: { wing: { description: @wing.description, name: @wing.name } }
    end

    assert_redirected_to wing_url(Wing.last)
  end

  test "should show wing" do
    get wing_url(@wing)
    assert_response :success
  end

  test "should get edit" do
    get edit_wing_url(@wing)
    assert_response :success
  end

  test "should update wing" do
    patch wing_url(@wing), params: { wing: { description: @wing.description, name: @wing.name } }
    assert_redirected_to wing_url(@wing)
  end

  test "should destroy wing" do
    assert_difference('Wing.count', -1) do
      delete wing_url(@wing)
    end

    assert_redirected_to wings_url
  end
end
