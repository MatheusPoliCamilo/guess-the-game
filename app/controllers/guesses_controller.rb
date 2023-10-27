class GuessesController < ApplicationController
  def show
    @name = params[:name]
    @game = Game.last
    @similarity_percentage = @game.similarity(@name)
  end
end
