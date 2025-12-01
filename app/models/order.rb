class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items

  validates :status, presence: true
  validates :subtotal, :tax, :total, presence: true, numericality: { greater_than: 0 }
  validates :shipping_street, :shipping_city, :shipping_province_name, :shipping_postal_code, presence: true

  enum status: {
    pending: 'pending',
    paid: 'paid',
    shipped: 'shipped',
    delivered: 'delivered',
    cancelled: 'cancelled'
  }

  def self.statuses_for_select
    statuses.keys.map { |status| [status.titleize, status] }
  end
end