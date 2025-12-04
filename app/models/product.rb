class Product < ApplicationRecord
  has_one_attached :main_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [400, 400]
    attachable.variant :large, resize_to_limit: [800, 800]
  end

  has_many_attached :gallery_images do |attachable|
    attachable.variant :thumb, resize_to_limit: [150, 150]
    attachable.variant :medium, resize_to_limit: [400, 400]
  end

  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, numericality: { greater_than: 0, less_than: 10000 }
  validates :brand, presence: true
  validates :category, presence: true

  scope :on_sale, -> { where(on_sale: true) }
  scope :new_arrivals, -> { where(new_arrival: true) }
  scope :recently_updated, -> { order(updated_at: :desc) }
end
