class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :shippingaddre, dependent: :destroy
end
