require 'test_helper'

class CcsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cc = ccs(:one)
  end

  test "should get index" do
    get ccs_url
    assert_response :success
  end

  test "should get new" do
    get new_cc_url
    assert_response :success
  end

  test "should create cc" do
    assert_difference('Cc.count') do
      post ccs_url, params: { cc: { ccexp: @cc.ccexp, ccname: @cc.ccname, ccnumber: @cc.ccnumber, ccv: @cc.ccv } }
    end

    assert_redirected_to cc_url(Cc.last)
  end

  test "should show cc" do
    get cc_url(@cc)
    assert_response :success
  end

  test "should get edit" do
    get edit_cc_url(@cc)
    assert_response :success
  end

  test "should update cc" do
    patch cc_url(@cc), params: { cc: { ccexp: @cc.ccexp, ccname: @cc.ccname, ccnumber: @cc.ccnumber, ccv: @cc.ccv } }
    assert_redirected_to cc_url(@cc)
  end

  test "should destroy cc" do
    assert_difference('Cc.count', -1) do
      delete cc_url(@cc)
    end

    assert_redirected_to ccs_url
  end
end
