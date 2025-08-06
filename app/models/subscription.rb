class Subscription < ApplicationRecord
  belongs_to :user
  has_many :invoices

  validates :plan_name, :price_cents, :interval, presence: true
end
