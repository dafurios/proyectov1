require 'test_helper'

class EnterprisesControllerTest < ActionDispatch::IntegrationTest
  test "should get _index" do
    get enterprises__index_url
    assert_response :success
  end

  test "should get index" do
    get enterprises_index_url
    assert_response :success
  end

  test "should get show" do
    get enterprises_show_url
    assert_response :success
  end

  test "should get edit" do
    get enterprises_edit_url
    assert_response :success
  end

end
