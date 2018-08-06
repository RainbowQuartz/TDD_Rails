require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

   def setup
    @user = users(:one)
  end

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "" } }
    assert_template 'sessions/new'
    get root_path
  end


    test "login with valid information" do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    assert_redirected_to club_path 
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end




end