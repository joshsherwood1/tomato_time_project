class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_#{id}"
    Match.create(id)
 end

 def unsubscribed
   Game.withdraw(id)
   Match.remove(id)
 end

 def take_turn(data)
   Game.take_turn(id, data)
 end

 def new_game()
   Game.new_game(id)
 end
end
