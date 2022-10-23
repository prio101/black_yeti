class DisableSubscriptionJob < ApplicationJob
  queue_as :default

  def perform(user)
    user.update(accept_newsletter: !user.accept_newsletter)
  end
end
