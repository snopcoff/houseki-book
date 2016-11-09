class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review

  scope :order_by_time, -> {order created_at: :desc}
end
