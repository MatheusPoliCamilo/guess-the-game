class GuessesController < ApplicationController
  def show
    @name = params[:name]
    @game = Game.last
    @similarity_percentage = @game.similarity(@name)

    player_game_id = cookies[:player_game_id]
    @player_game = PlayerGame.find(player_game_id)
    Guess.create!(player_game: @player_game, name: @name, similarity: @similarity_percentage.to_i)

    render "guesses/_show", locals: { player_game: @player_game }
  end
end
