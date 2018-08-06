class StaticPagesController < ApplicationController

  def home
  end

  def club
    @user = User.all
  end

end


