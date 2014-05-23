class GamesController < ApplicationController

  include GamesHelper

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new player_x_id: current_player.id, player_o_id: params[:game][:player_o].to_i
    @game.next_player = [@game.player_o_id, @game.player_x_id].shuffle.first
    @game.save
    redirect_to @game
  end

  def make_move
    @move = Move.new player_id: current_player.id, game_id: params['game_id'].to_i, position: params['position'].to_i
    
    if @move.save

      @game = Game.find(@move.game_id)
      flash[:notice] = "You won this game" if @game.win?(current_player)
      if @game.next_player == @game.player_x_id
        @game.next_player = @game.player_o_id
      else 
        @game.next_player = @game.player_x_id  
      end
      @game.save
    end

    # detect if player is AI
    puts @game.next_player == 1
    if @game.next_player == 1
      # if is AI make a move by AI (random select from empty_spaces)
      @move = Move.create! player_id: 1, game_id: @game.id, position: @game.ai_move
      @game.next_player = current_player.id
      @game.save
    end

    redirect_to @game
  end

  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Move was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_url
  end

end
