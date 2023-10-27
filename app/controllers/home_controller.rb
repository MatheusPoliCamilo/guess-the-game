class HomeController < ApplicationController
  def index
    @games = Game.all
    @current_game = Game.last

    player_game_id = cookies[:player_game_id]

    if player_game_id.present? && PlayerGame.exists?(player_game_id) && PlayerGame.find(player_game_id).game == @current_game
      @player_game = PlayerGame.find(player_game_id)
    else
      @player_game = PlayerGame.create!(game: @current_game)
      cookies[:player_game_id] = @player_game.id
    end
  end
end
