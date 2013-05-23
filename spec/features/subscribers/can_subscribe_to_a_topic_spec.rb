require 'rspectacular/spec_helpers/rails_engine'
require 'hootenanny'

###
# In order for me to properly handle items I am interested in in a timely manner,
# As a potential Subscriber
# I want to be able to get notifications about updates to a topic I am interressted in
#
feature 'Subscribers can subscribe to a topic' do
  scenario 'Potential subscribers can subscribe to a new topic' do
    # Given there are no subscriptions
    expect( Hootenanny::Subscription ).to have(0).items

    # When a subscription is requested for a topic
    post( '/hootenanny/subscription', topic:     'my_topic',
                                      callback:  'my_callback')

    # Then the subscriber should be subscribed
    expect( Hootenanny::Subscription.to('my_topic') ).to have(1).item

    # And the response should be 204 'No Content'
    expect( last_response.status ).to eql 204
    expect( last_response ).to be_empty
  end
end
