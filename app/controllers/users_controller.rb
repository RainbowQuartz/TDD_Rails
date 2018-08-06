class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy]
  
  def new
    puts "====================new========================"
    @user = User.new
  end

  def show
    puts "====================show========================"
    @user = User.find(params[:id])
  end

  def create
    puts "====================create========================"
    puts params.inspect
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    puts "====================edit========================"
    @user = User.find(params[:id])
  end

  def update
    puts "====================update========================"
    puts params.inspect
    user = User.create(user_params)
    redirect_to root_path
  end

  def destroy
    puts "====================delete========================"
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
    puts "---------------------end--------------------------"
  end

  private

   def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end

    def correct_user
    @user = User.find(params[:id])
    redirect_to login_path unless current_user?(@user)
    end

    def logged_in_user
      unless logged_in?
      store_location
      redirect_to login_path
      end
   end 

end
