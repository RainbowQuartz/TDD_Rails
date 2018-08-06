require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:one)
    @user2 = users(:two)
  end


  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  @user2.first_name,
                                         last_name: @user2.last_name,
                                         email: @user2.email } }
    end
    assert_template 'users/new'
  end

test "valid signup information" do
  get new_user_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  @user1.first_name,
                                         last_name: @user1.last_name,
                                         email: @user1.email } }
      end
      follow_redirect!
      assert_template 'users/show'
  end

end