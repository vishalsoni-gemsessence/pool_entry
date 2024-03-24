require "application_system_test_case"

class CustomersTest < ApplicationSystemTestCase
  setup do
    @customer = customers(:first) # Reference to the first fixture customer
  end

  test "Showing a customer" do
    visit customers_path
    click_link @customer.name

    assert_selector "h1", text: @customer.name
    assert_text @customer.address
    assert_text @customer.contact_number
  end

  test "Updating a customer" do
    visit customers_path
    assert_selector "h1", text: "Customers"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit customer"

    fill_in "Name", with: "Updated customer"
    click_on "Update customer"

    assert_selector "h1", text: "Customers"
    assert_text "Updated customer"
  end

  test "Editing a customer with pre-filled fields" do
    visit edit_customer_path(@customer)
    assert_field "Name", with: @customer.name
    assert_field "Address", with: @customer.address
    assert_field "Contact number", with: @customer.contact_number
  end

  test "Destroying a customer" do
    visit customers_path
    assert_text @customer.name

    click_on "Delete", match: :first
    assert_no_text @customer.name
  end

  test "Creating a customer with valid data" do
    visit new_customer_path

    fill_in "Name", with: "New Customer"
    fill_in "Address", with: "New Address"
    fill_in "Contact number", with: "123-456-7890"

    click_on "Create customer"

    assert_selector "h1", text: "Customers"
    assert_text "New Customer"
  end

  test "Creating a customer with invalid data" do
    visit new_customer_path

    # Submit without filling in any fields
    click_on "Create customer"

    assert_selector "h1", text: "New customer"
    assert_text "Name can't be blank"
    assert_text "Address can't be blank"
    assert_text "Contact number can't be blank"
  end
end
