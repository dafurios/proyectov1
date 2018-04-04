require 'test_helper'

class DriversControllerTest < ActionDispatch::IntegrationTest
  test "should get _index" do
    get drivers__index_url
    assert_response :success
  end

  test "should get index" do
    get drivers_index_url
    assert_response :success
  end

  test "should get show" do
    get drivers_show_url
    assert_response :success
  end

  test "should get edit" do
    get drivers_edit_url
    assert_response :success
  end

end
