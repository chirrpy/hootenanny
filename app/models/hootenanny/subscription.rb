require 'uri'
require 'hootenanny/errors'

module  Hootenanny
class   Subscription < ActiveRecord::Base
  self.table_name = 'hootenanny_subscriptions'

  ###
  # Private: Finds all subscriptions which are subscribed to a given topic
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

  ###
  # Private: Assigns a given subscriber to a given topic URL by creating
  # a Subscription.
  #
  # options - A Hash of options
  #
  #           :subscriber - A String representing the URI which should be
  #                         notified when changes occur on the topic
  #           :to         - A String representing the topic URI which is
  #                         publishing the items that the subscriber is
  #                         interested in.
  #
  # Example:
  #
  #   # If a subscription does not yet exist for the subscriber/topic, it
  #   # creates # a new Subscription
  #
  #   Subscription.assign(subscriber: 'http://example.com/my_callback',
  #                       to:         'http://example.org/my_topic')
  #
  #   # => <Subscription subscriber:  'http://example.com/my_callback',
  #                      topic:       'http://example.org/my_topic'>
  #
  #
  #
  #   # If a subscription already exists for the subscriber/topic, it retrieves
  #   # and returns the current Subscription
  #
  #   Subscription.assign(subscriber: 'http://example.com/my_callback',
  #                       to:         'http://example.org/my_topic')
  #
  #   # => <Subscription subscriber:  'http://example.com/my_callback',
  #                      topic:       'http://example.org/my_topic'>
  #
  # Returns a Subscription
  #
  def self.assign(options = {})
    subscriber = URI.parse(options.fetch(:subscriber)).to_s
    topic      = URI.parse(options.fetch(:to)).to_s

    where( subscriber: subscriber, topic: topic).first ||
    create(subscriber: subscriber, topic: topic)
  rescue URI::InvalidURIError
    raise Hootenanny::SubscriptionAssignmentError.new('All options passed need to be valid URIs')
  end
end
end
