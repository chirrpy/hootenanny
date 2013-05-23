require 'rspectacular/spec_helpers/active_record_basic'
require 'hootenanny/subscription'

describe Hootenanny::Subscription do
  it 'can find itself based on its topic' do
    existing_subscription = create(:subscription, :topic => 'my_topic')

    found_subscriptions = Hootenanny::Subscription.to('my_topic')
    found_subscription  = found_subscriptions.first

    expect(found_subscriptions).to have(1).item

    expect(found_subscription).to be_a Hootenanny::Subscription
    expect(found_subscription.topic).to eql 'my_topic'
  end
end
