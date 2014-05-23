module GamesHelper
  def grid_button position, game
    last_player_id = game.next_player
    if last_player_id == current_player.id
      ""
    # elsif  'win?' method on players belonging to game>
    #   ""
    else
      link_to("?", make_move_path(:position => position, :game_id => game.id, player_id: current_player), :method => :post)
    end
  end
end