require "application_system_test_case"

class OrderRowsTest < ApplicationSystemTestCase
  setup do
    @order_row = order_rows(:one)
  end

  test "visiting the index" do
    visit order_rows_url
    assert_selector "h1", text: "Order rows"
  end

  test "should create order row" do
    visit order_rows_url
    click_on "New order row"

    fill_in "Item", with: @order_row.item_id
    fill_in "Order", with: @order_row.order_id
    click_on "Create Order row"

    assert_text "Order row was successfully created"
    click_on "Back"
  end

  test "should update Order row" do
    visit order_row_url(@order_row)
    click_on "Edit this order row", match: :first

    fill_in "Item", with: @order_row.item_id
    fill_in "Order", with: @order_row.order_id
    click_on "Update Order row"

    assert_text "Order row was successfully updated"
    click_on "Back"
  end

  test "should destroy Order row" do
    visit order_row_url(@order_row)
    click_on "Destroy this order row", match: :first

    assert_text "Order row was successfully destroyed"
  end
end
