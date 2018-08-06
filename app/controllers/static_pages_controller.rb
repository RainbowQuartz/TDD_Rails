class StaticPagesController < ApplicationController

  def home
  end

  def club
    @user = User.all
    if logged_in?
    else
      redirect_to 'sessions#new'
    end
  end

end
