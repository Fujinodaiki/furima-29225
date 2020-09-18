class Order < ApplicationRecord
  belongs_to :item
  has_one    :shippingaddre

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :areaofdelivery
  validates :areaofdelivery_id, numericality: { other_than: 1 }, presence: true
end
