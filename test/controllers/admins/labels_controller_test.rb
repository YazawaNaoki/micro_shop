require 'test_helper'

class Admins::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_labels_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_labels_show_url
    assert_response :success
  end

  test "should get new" do
    get admins_labels_new_url
    assert_response :success
  end

end
