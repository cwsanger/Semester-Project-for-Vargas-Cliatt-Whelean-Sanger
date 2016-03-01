require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get start" do
    get :start
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

end
