class SessionsController < ApplicationController
  def new 
  end

  def create 
    player = Player.find_by_email(params[:email])
    if player && player.authenticate(params[:password])
      session[:player_id] = player.id
      redirect_to root_path, notice: "logged in!"
    else
      flash.now.alert = "invalid login credentials"
      render "new"
    end
  end
  
  def destroy
    session[:player_id] = nil
    redirect_to root_url, notice: "logged out!"
  end
end