require "application_system_test_case"

class BillingsTest < ApplicationSystemTestCase
  setup do
    @billing = billings(:one)
  end

  test "visiting the index" do
    visit billings_url
    assert_selector "h1", text: "Billings"
  end

  test "creating a Billing" do
    visit billings_url
    click_on "New Billing"

    fill_in "Address", with: @billing.address
    fill_in "City", with: @billing.city
    fill_in "Country", with: @billing.country
    fill_in "Email", with: @billing.email
    fill_in "Firstname", with: @billing.firstname
    fill_in "Lastname", with: @billing.lastname
    fill_in "Phone", with: @billing.phone
    fill_in "State", with: @billing.state
    click_on "Create Billing"

    assert_text "Billing was successfully created"
    click_on "Back"
  end

  test "updating a Billing" do
    visit billings_url
    click_on "Edit", match: :first

    fill_in "Address", with: @billing.address
    fill_in "City", with: @billing.city
    fill_in "Country", with: @billing.country
    fill_in "Email", with: @billing.email
    fill_in "Firstname", with: @billing.firstname
    fill_in "Lastname", with: @billing.lastname
    fill_in "Phone", with: @billing.phone
    fill_in "State", with: @billing.state
    click_on "Update Billing"

    assert_text "Billing was successfully updated"
    click_on "Back"
  end

  test "destroying a Billing" do
    visit billings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Billing was successfully destroyed"
  end
end
