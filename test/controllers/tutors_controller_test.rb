require 'test_helper'

class TutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get _index" do
    get tutors__index_url
    assert_response :success
  end

  test "should get index" do
    get tutors_index_url
    assert_response :success
  end

  test "should get show" do
    get tutors_show_url
    assert_response :success
  end

  test "should get edit" do
    get tutors_edit_url
    assert_response :success
  end

end
