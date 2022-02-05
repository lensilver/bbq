module SubscriptionsHelper
  def already_subscribed?(event)
    current_user == event.user || event.subscribers.include?(current_user)
  end
end
