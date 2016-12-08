class Review < ApplicationRecord
  include PublicActivity::Model

  after_create :create_activities_review
  after_update :update_activities_review

  belongs_to :user
  belongs_to :book

  has_many :comments, dependent: :destroy

  scope :order_by_time, -> {order created_at: :desc}
  after_save :calculate_score

  private
  def calculate_score
    sum = book.reviews.reduce(0) {|sum, element| sum + element.rating}
    average_score = sum / book.reviews.count
    book.update_attribute :rate_score, average_score
  end

  def create_activities_review
    self.create_activity key: "create", owner: self.user
  end

  def update_activities_review
    self.create_activity key: "update", owner: self.user
  end
end
