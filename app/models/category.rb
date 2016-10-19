class Category < ApplicationRecord
  has_many :books

  scope :order_by_time, -> {order created_at: :desc}
end
