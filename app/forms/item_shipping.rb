class ItemShipping

  include ActiveModel::Model
  attr_accessor :postalcode
  attr_accessor :municipalities
  attr_accessor :areaofdelivery_id
  attr_accessor :address
  attr_accessor :buildingname
  attr_accessor :phonenumber
  attr_accessor :token
  attr_accessor :user_id
  attr_accessor :item_id
  

  
  def save
    order= Order.create(user_id: user_id, item_id: item_id)
    Shippingaddre.create(postalcode: postalcode, municipalities: municipalities, areaofdelivery_id: areaofdelivery_id, address: address, buildingname: buildingname, phonenumber: phonenumber,order_id: order.id )
  end

end