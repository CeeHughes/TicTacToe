class PlayersController < ApplicationController
 
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end  
   
  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end
   
  def create 
    @player = Player.new(params[:player])
    if @player.save
      redirect_to players_path
    else
      render 'new'
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(params[:player])
      redirect_to player_path, notice: 'Player details updated'
    else
      render action: 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to users_path
  end

end