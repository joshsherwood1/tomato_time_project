class Game < ApplicationRecord
  validates_presence_of :category, :difficulty, :number_of_questions, :custom_name
  belongs_to :user

  class Game < ApplicationRecord
    def self.start(player1, player2)
      # Randomly choses who gets to be noughts or crosses
      cross, nought = [player1, player2].shuffle

      # Broadcast back to the players subscribed to the channel that the game has started
      ActionCable.server.broadcast "player_#{cross}", {action: "game_start", msg: "cross"}
      ActionCable.server.broadcast "player_#{nought}", {action: "game_start", msg: "nought"}

      # Store the details of each opponent
      REDIS.set("opponent_for:#{cross}", nought)
      REDIS.set("opponent_for:#{nought}", cross)
    end

    def self.withdraw(id)
      if winner = opponent_for(id)
        ActionCable.server.broadcast "player_#{winner}", {action: "opponent_withdraw"}
      end
    end

    def self.opponent_for(id)
      REDIS.get("opponent_for:#{id}")
    end

    def self.take_turn(id, move)
      opponent = opponent_for(id)

      ActionCable.server.broadcast "player_#{opponent}", {action: "take_turn", move: move['data']}
    end

    def self.new_game(id)
      opponent = opponent_for(id)

      ActionCable.server.broadcast "player_#{opponent}", {action: "new_game"}
    end
  end
end
