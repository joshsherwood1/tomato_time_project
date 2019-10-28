class Match < ApplicationRecord

  def self.create(uuid)
    if REDIS.get("matches").blank?
      REDIS.set("matches", uuid)
    else
      opponent = REDIS.get("matches")

      Game.start(uuid, opponent)

      REDIS.set("matches", nil)
    end
  end

  def self.remove(uuid)
    if uuid == REDIS.get("matches")
      REDIS.set("matches", nil)
    end
  end

  def self.clear_all
    REDIS.del("matches")
  end
end
