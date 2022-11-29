require "test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get list_items" do
    get cart_list_items_url
    assert_response :success
  end

  test "should get add_item" do
    get cart_add_item_url
    assert_response :success
  end

  test "should get delete_item" do
    get cart_delete_item_url
    assert_response :success
  end
end
