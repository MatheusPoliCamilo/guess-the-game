namespace :game do
  desc "Call the Game.today method"
  task today: :environment do
    Game.today
  end
end
