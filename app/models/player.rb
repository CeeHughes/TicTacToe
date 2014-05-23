class Player < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  attr_accessible :email, :name, :password, :password_confirmation
  has_many :player_x_games, foreign_key: "player_x_id", class_name: "Game"
  has_many :player_o_games, foreign_key: "player_o_id", class_name: "Game"
  has_many :invitations, foreign_key: "player_invited_id", class_name: "Game"
  has_many :accepteds


  def games
    (player_x_games + player_o_games).sort_by(&:created_at).reverse
  end

  def is_player_ai?
    id.to_i == 1
  end

  def games_won_total 
    n = player_x_games.where(self.won_game?)
    n += player_o_games.where(self.won_game?)
  end
 
  def games_drawn_total 
    n = player_x_games.where(self.draw?)
    n += player_o_games.where(self.draw?)
  end

  def games_won_total 
    n = player_x_games.where(player_o.won_game?)
    n += player_o_games.where(player_x.won_game?)
  end

  # def invitations

  # end
  # need a list of invitations a player has

end

