class Order < ApplicationRecord
  belongs_to :item
  has_one    :shippingaddre
  
  
  # validates :areaofdelivery_id, numericality: { other_than: 1 }, presence: true
end
