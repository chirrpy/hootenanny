require 'hootenanny/subscription'

module  Hootenanny
class   Hub

  ###
  # Public: Subscribes the given callback to the given topic.  Whenever the
  # given topic is updated, the hub will send all updates to the given callback
  # URL.
  #
  # This method is idempotent.  If a subscription already exists, it will be
  # reused and sent back without notifying the user of that fact.
  #
  # callback - A String or URI representing the callback URI which should be
  #            sent updates to the given topic.  Whenever changes are discovered
  #            to the topic URL's feed (see below), those changes will be sent
  #            to this callback URI.
  # options  - A Hash of options
  #
  #            :to - The topic which should be subscribed to.  This should be
  #                  a String or URI representing the URI which will deliver the
  #                  activities for a given topic/item/resource.
  #
  #                  For example if I have a site which handles blogs, I may
  #                  expose a feed for all of the activity on the blog at:
  #
  #                  http://www.example.com/activities/blog/123
  #
  # Returns a Hootenanny::Subscription
  # Raises Hootenanny::SubscriptionAssignmentError with a message describing the
  #   problem
  #
  def self.subscribe(callback, options = {})
    callback = callback.dup
    topic    = options.fetch(:to).dup

    Hootenanny::Subscription.assign(subscriber: callback,
                                    to:         topic)
  end
end
end
