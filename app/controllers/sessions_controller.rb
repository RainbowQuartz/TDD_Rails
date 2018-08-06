class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
   if User.all.include?(@user)
     log_in(@user)
     redirect_to club_path
     puts 'connexion réussie'
   else
     puts 'connexion non réussie'# Create an error message.
     render 'new'
   end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
