require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test 'Show info of the user after logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    get user_path(@user)
    assert_select "h1", "Welcome #{@user.first_name}"
  end

  test 'redirect to login if not connected' do
    get user_path(@user)
    assert_redirected_to login_path
    follow_redirect! 
  end


end
