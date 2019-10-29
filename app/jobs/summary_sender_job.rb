class SummarySenderJob < ApplicationJob
  queue_as :default

  def perform(current_user, score)
    UserNotifierMailer.inform(current_user, score).deliver_now
  end
end
