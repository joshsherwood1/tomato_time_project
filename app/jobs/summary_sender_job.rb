class SummarySenderJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserNotifierMailer.inform(user).deliver_now
  end
end
