class ItemShipping
  include ActiveModel::Model
  attr_accessor :postalcode,:municipalities,:areaofdelivery_id,:address,:buildingname,:phonenumber,:token,:user_id,:item_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  PHONNEMUBER_CODE_REGEX = /\A\d{11}\z/

  with_options presence: true do
    validates :postalcode, format: { with: POSTAL_CODE_REGEX }
    validates :municipalities
    validates :areaofdelivery_id, numericality: { other_than: 1 }
    validates :address
    validates :phonenumber, format: { with: PHONNEMUBER_CODE_REGEX }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shippingaddre.create(postalcode: postalcode, municipalities: municipalities, areaofdelivery_id: areaofdelivery_id, address: address, buildingname: buildingname, phonenumber: phonenumber, order_id: order.id)
  end
end
