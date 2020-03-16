require 'test_helper'

class Admins::ArrivalsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_arrivals_index_url
    assert_response :success
  end

  test "should get new" do
    get admins_arrivals_new_url
    assert_response :success
  end

  test "should get show" do
    get admins_arrivals_show_url
    assert_response :success
  end

end
