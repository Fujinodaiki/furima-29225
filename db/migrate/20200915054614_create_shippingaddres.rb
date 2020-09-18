class CreateShippingaddres < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingaddres do |t|
      t.string           :postalcode,          null:false
      t.string           :municipalities,      null:false
      t.integer          :areaofdelivery_id,   null:false
      t.string           :address,             null:false
      t.string           :buildingname             
      t.string           :phonenumber,         null:false
      t.references       :order,               null: false, foreign_key: true
      t.timestamps
    end
  end
end
