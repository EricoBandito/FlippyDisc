require 'test_helper'

class DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discs_index_url
    assert_response :success
  end

  test "should get show" do
    get discs_show_url
    assert_response :success
  end

end
