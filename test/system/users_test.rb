require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase

    def setup
    @user = User.create(first_name: "tintin", last_name: "toto", email: "user@email.fr") 
  end


 test "creating a user" do
    visit new_user_path
    fill_in "First name", with: @user.first_name
    fill_in "Last name", with: @user.last_name
    fill_in "Email", with: @user.email
    click_on "Create my account"
   # assert_redirected_to root_path
  end

 test "Log in a user " do
    visit login_path
    fill_in "Email", with: "test@gmail.com"
    click_on "Log in"
   # assert_redirected_to '/'
  end

end
