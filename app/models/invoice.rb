class Client < ApplicationRecord
  belongs_to :user
  has_many :invoices

  validates :name, :email, presence: true
end
