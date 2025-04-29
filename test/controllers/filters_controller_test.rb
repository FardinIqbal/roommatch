require "test_helper"

class FiltersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get filters_edit_url
    assert_response :success
  end

  test "should get update" do
    get filters_update_url
    assert_response :success
  end
end
