# This migration comes from hootenanny (originally 20130522014217)
class CreateSubscriptionTable < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.timestamps
    end
  end
end
