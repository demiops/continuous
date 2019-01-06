require "application_system_test_case"

class CcsTest < ApplicationSystemTestCase
  setup do
    @cc = ccs(:one)
  end

  test "visiting the index" do
    visit ccs_url
    assert_selector "h1", text: "Ccs"
  end

  test "creating a Cc" do
    visit ccs_url
    click_on "New Cc"

    fill_in "Ccexp", with: @cc.ccexp
    fill_in "Ccname", with: @cc.ccname
    fill_in "Ccnumber", with: @cc.ccnumber
    fill_in "Ccv", with: @cc.ccv
    click_on "Create Cc"

    assert_text "Cc was successfully created"
    click_on "Back"
  end

  test "updating a Cc" do
    visit ccs_url
    click_on "Edit", match: :first

    fill_in "Ccexp", with: @cc.ccexp
    fill_in "Ccname", with: @cc.ccname
    fill_in "Ccnumber", with: @cc.ccnumber
    fill_in "Ccv", with: @cc.ccv
    click_on "Update Cc"

    assert_text "Cc was successfully updated"
    click_on "Back"
  end

  test "destroying a Cc" do
    visit ccs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cc was successfully destroyed"
  end
end
