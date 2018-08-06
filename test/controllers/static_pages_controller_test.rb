require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
   @user = users(:one)
  end

  test 'Get to homepage' do
    get '/'
    assert_response :success
  end

  test 'Assert the presence of login links when logged out' do
    get '/'
    assert_select "a[href=?]", club_path, count: 0
    assert_select "a[href=?]", login_path, count: 2
  end

  test 'Assert the presence of club link when logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    follow_redirect!
    get '/'
    assert_select "a[href=?]", club_path, count: 2
    assert_select "a[href=?]", login_path, count: 0
  end

  test 'Assert redirection to login when logged_out' do
    get '/club'
    assert_redirected_to 'sessions#new'
    follow_redirect!
  end

  test 'Assert possibility to access club page when logged_in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    assert_redirected_to club_path
    follow_redirect!
  end

  test 'Assert presence of a table containing all users on club page' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    assert_redirected_to club_path
    follow_redirect!
    #assert the presence of 3 rows in
    assert_select 'table', count: 3
  end

  test 'Navbar shows items when logged in' do
    get login_path
    post login_path, params: { session: { email: @user.email  } }
    follow_redirect!
    get '/'
    assert_select "header a[href=?]", root_path, count: 1
    assert_select "header a[href=?]", '/user/:id', count: 1
    assert_select "header a[href=?]", logout_path, count: 1
    assert_select "header a[href=?]", club_path, count: 1
  end

  test 'Navbar shows items when logged out' do
    get '/'
    assert_select "header a[href=?]", root_path, count: 1
    assert_select "header a[href=?]", login_path, count: 1
  end
  # test "the truth" do
  #   assert true
  # end
end
