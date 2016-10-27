class Book < ApplicationRecord
  belongs_to :category

  has_many :reviews

  validates :category_id, presence: true
  validates :title, presence: true, length: {maximum: Settings.max_value}
  validates :description, presence: true, length: {maximum: Settings.max_value}
  validates :author, presence: true, length: {maximum: Settings.max_value}
  validates :pages, presence: true, length: {maximum: Settings.max_page},
    numericality: {only_integer: true}

  mount_uploader :picture, PictureUploader

  scope :order_by_time, -> {order created_at: :desc}
end