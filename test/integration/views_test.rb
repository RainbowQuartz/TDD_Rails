require 'test_helper'
require 'minitest/autorun'


class ViewsTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(first_name: "tintin", last_name: "toto", email: "user@email.fr") 
  end

  test "can access to login_page" do 
  get login_path  
  assert_response :success
end


 test "creating a user" do
    visit new_user_path
    fill_in "First name", with: "tintin"
    fill_in "Last name", with: "toto"
    fill_in "Email", with: "user@email.fr"
    click_on "Create my account"
    assert_redirected_to user_path
  end

end
