class Move < ActiveRecord::Base
  attr_accessible :game, :game_id, :player, :player_id, :position
  belongs_to :player
  belongs_to :game

  #TODO: add custom validation to check position is free
  #TODO: add custom validation to check it is the this player's turn
  #TODO: add custom validation to check game hasn't already been won
  # validates: current_player, presence: true
  # validates: empty_squares, presence: true
  # validates: won?

  def player_x?
    player.id == game.player_x_id
  end

  def player_o?
    player.id == game.player_o_id
  end

  def counter
    player_x? ? "X" : "O"
  end

  def player_moves
    Move.where(game_id: self.game_id).collect{|move| moves}
  end

end
