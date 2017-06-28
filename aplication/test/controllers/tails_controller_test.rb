require 'test_helper'

class TailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tail = tails(:one)
  end

  test "should get index" do
    get tails_url
    assert_response :success
  end

  test "should get new" do
    get new_tail_url
    assert_response :success
  end

  test "should create tail" do
    assert_difference('Tail.count') do
      post tails_url, params: { tail: { description: @tail.description, name: @tail.name } }
    end

    assert_redirected_to tail_url(Tail.last)
  end

  test "should show tail" do
    get tail_url(@tail)
    assert_response :success
  end

  test "should get edit" do
    get edit_tail_url(@tail)
    assert_response :success
  end

  test "should update tail" do
    patch tail_url(@tail), params: { tail: { description: @tail.description, name: @tail.name } }
    assert_redirected_to tail_url(@tail)
  end

  test "should destroy tail" do
    assert_difference('Tail.count', -1) do
      delete tail_url(@tail)
    end

    assert_redirected_to tails_url
  end
end
