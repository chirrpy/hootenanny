require 'rspectacular/spec_helpers/active_record_basic'
require 'hootenanny/subscription'

Subscription ||= Hootenanny::Subscription

describe Hootenanny::Subscription do
  it 'can find itself based on its topic' do
    existing_subscription = create(:subscription, :topic => 'my_topic')

    found_subscriptions = Subscription.to('my_topic')
    found_subscription  = found_subscriptions.first

    expect(found_subscriptions).to have(1).item

    expect(found_subscription).to be_a Subscription
    expect(found_subscription.topic).to eql 'my_topic'
  end

  context 'when a subscription does not exist for a given subscriber and topic' do
    before { expect(Subscription.count).to be_zero }

    it 'can assign a subscription to a given subscriber and topic' do
      assigned_subscription = Subscription.assign( subscriber: 'http://example.com/my_callback',
                                                   to:         'http://example.org/my_topic')

      expect(assigned_subscription).to             be_persisted
      expect(assigned_subscription.subscriber).to  eql 'http://example.com/my_callback'
      expect(assigned_subscription.topic).to       eql 'http://example.org/my_topic'
    end
  end

  context 'when a subscription already exists for a given subscriber and topic' do
    let!(:existing_subscription) do
      create(:subscription, subscriber: 'http://example.com/my_callback',
                            topic:      'http://example.org/my_topic')
    end

    it 'can does not create a new subscription but rather returns the current one' do
      assigned_subscription = Subscription.assign( subscriber: 'http://example.com/my_callback',
                                                   to:         'http://example.org/my_topic')

      expect(assigned_subscription).to eql existing_subscription
    end
  end
end
