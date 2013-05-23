require 'rspectacular/spec_helpers/active_record_basic'
require 'hootenanny/hub'

describe Hootenanny::Hub do
  it 'can subscribe a callback to a topic' do
    Hootenanny::Subscription.should_receive(:assign)
                            .with(
                                    subscriber: 'my_callback',
                                    to:         'my_topic'
                                  )

    Hootenanny::Hub.subscribe('my_callback',
                              to: 'my_topic')
  end
end
