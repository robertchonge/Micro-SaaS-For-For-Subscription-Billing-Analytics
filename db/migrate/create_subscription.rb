class CreateSubscriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :plan_name
      t.integer :price_cents
      t.string :interval
      t.string :stripe_subscription_id
      t.timestamps
    end
  end
end
