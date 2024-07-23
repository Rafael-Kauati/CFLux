class Transaction < ApplicationRecord
  belongs_to :user
  
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :category, presence: true
  validates :transaction_type, presence: true, inclusion: { in: %w[income expense] }
  validates :description, length: { maximum: 500 }
end
