# This migration comes from hootenanny (originally 20130522235837)
class AddTopicToSubscriptions < ActiveRecord::Migration
  def change
    add_column    :hootenanny_subscriptions, :topic, :string, :limit => 250
    change_column :hootenanny_subscriptions, :topic, :string, :limit => 250, :null => false

    add_index :hootenanny_subscriptions, :topic, :unique => false
  end
end
