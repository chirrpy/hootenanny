module  Hootenanny
class   Subscription < ActiveRecord::Base
  self.table_name = 'hootenanny_subscriptions'

  ###
  # Public: Finds all subscriptions which are subscribed to a given topic
  #
  # topic - A String represeenting a topic which has been subscribed to
  #
  # Example:
  #
  #   Subscription.to('http://example.com/foo')
  #   # => <ActiveRelation>
  #
  # Returns an ActiveRelation which (if it has not been chained) represents the
  #   subscriptions which are subscribed to the topic.
  #
  def self.to(topic)
    where(:topic => topic)
  end
end
end
