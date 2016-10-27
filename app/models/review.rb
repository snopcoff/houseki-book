class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  scope :order_by_time, -> {order created_at: :desc}
end
