class Game < ApplicationRecord
  def self.today
    Game.create!(name: Game.get_name)
  end

  def self.get_name
    OpenAI::Client.new.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          {
            role: "user",
            content: 'Responda com o nome de um jogo aleatório para PC, Playstation, Xbox ou Nintendo Switch. Exemplo: "Baldur\'s Gate 3"'
          }
        ]
      }
  )["choices"].first["message"]["content"]
  end
end
