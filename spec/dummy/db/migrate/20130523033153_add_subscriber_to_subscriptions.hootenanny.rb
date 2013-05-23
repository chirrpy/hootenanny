# This migration comes from hootenanny (originally 20130523032940)
class AddSubscriberToSubscriptions < ActiveRecord::Migration
  def change
    add_column    :hootenanny_subscriptions, :subscriber, :string, :liimit => 250
    change_column :hootenanny_subscriptions, :subscriber, :string, :liimit => 250, :null => false

    add_index :hootenanny_subscriptions, :subscriber,            :unique => false
    add_index :hootenanny_subscriptions, [:subscriber, :topic],  :unique => true
  end
end
