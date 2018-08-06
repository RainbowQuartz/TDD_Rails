require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'first_name', last_name: 'last_name', email: 'user@example.com')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'first_name should be present' do
    @user.first_name = nil
    assert_not @user.valid?
  end

  test 'first_name should contain letters' do
    @user.first_name = ' '
    assert_not @user.valid?
  end

  test 'last_name should be present' do
    @user.last_name = nil
    assert_not @user.valid?
  end

  test 'last_name should contain letters' do
    @user.last_name = ' '
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = nil
    assert_not @user.valid?
  end

  test 'email should be in email format' do
    @user.email = 'mail.mail.com'
    assert_not @user.valid?
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
end
