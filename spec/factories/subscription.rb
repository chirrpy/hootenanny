FactoryGirl.define do
  factory :subscription, :class => 'Hootenanny::Subscription' do
    subscriber                        'my_subscriber'
    topic                             'my_topic'
  end
end
