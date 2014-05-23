class Game < ActiveRecord::Base

  WINNING_SETS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ].map(&:to_set)

  POSITIONS = (0..8).to_a


  attr_accessible :player_x, :player_o, :player_x_id, :player_o_id, :result
  belongs_to :player_x, class_name: 'Player'
  belongs_to :player_o, class_name: 'Player'
  has_many :moves


  # Work out result
  def win?(player)
    return false unless moves.count >= 5
    
    move_set = moves.where(player_id: player.id).map(&:position).to_set
    
    WINNING_SETS.any? do |win_set|
      move_set.superset? win_set
    end
  end

  def draw?(player)
    if moves.count == 9 && result != win?
      result = "draw"
    end
  end

  # Find available squares
  def empty_squares
    POSITIONS - moves.map { |move| move.position }.uniq
  end

  def ai_move
    empty_squares.sample
  end

  def move_counter_for_position(pos)
    move = moves.detect { |m| m.position == pos }
    move ? move.counter : nil
  end

end