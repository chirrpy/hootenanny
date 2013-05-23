# This migration comes from hootenanny (originally 20130522020623)
class RenameSubscriptionsTable < ActiveRecord::Migration
  def up
    rename_table :subscriptions, :hootenanny_subscriptions
  end

  def down
    rename_table :hootenanny_subscriptions, :subscriptions
  end
end
