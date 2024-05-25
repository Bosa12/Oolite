require "test_helper"

class ServiceControllerTest < ActionDispatch::IntegrationTest
  test "should get project" do
    get service_project_url
    assert_response :success
  end

  test "should get contact" do
    get service_contact_url
    assert_response :success
  end
end
