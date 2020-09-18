FactoryBot.define do
  factory :shippingaddre do
    postalcode                  {"123-4567"}
    areaofdelivery_id           {"2"}
    municipalities              {"青森"}
    address                     {"りんご"}
    buildingname                {"最高"}
    phonenumber                 {"09012341234"}
    association :order
  end
end
