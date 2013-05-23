FactoryGirl.define do
  factory :subscription, :class => 'Hootenanny::Subscription' do
    topic                             'my_topic'
  end
end
