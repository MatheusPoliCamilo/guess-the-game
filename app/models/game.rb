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

  def similarity(name)
    similarity_percentage = OpenAI::Client.new.chat(
        parameters: {
          model: "gpt-4",
          messages: [
            {
              role: "user",
              content: <<~HEREDOC
                Iremos fazer a adivinhação de um jogo:
                  - Jogo: #{self.name}
                  - Tentativa: #{name}
                
                Retorne a similaridade de 0 a 100 entre o nome do jogo e a tentativa.
                
                Para a similaridade, considere: Nome do jogo, descrição, gênero, plataformas, desenvolvedora, publisher,
                data de lançamento, tags, avaliações, preço, e outras informações que você julgar relevante.

                Só retorne 100 se o nome do jogo for exatamente igual (ignorando maiúsculas, minúsculas, acentos,
                pontuação e espaços).

                Exemplo de retorno: 50

                NUNCA me responda nada nada além de um número inteiro entre 0 e 100.
              HEREDOC
            }
          ]
        }
    )["choices"].first["message"]["content"]

    similarity_percentage
  end
end
