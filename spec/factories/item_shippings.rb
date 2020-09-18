FactoryBot.define do
  factory :item_shipping do
    postalcode                  {"123-4567"}
    areaofdelivery_id           {"2"}
    municipalities              {"青森"}
    address                     {"りんご"}
    buildingname                {"最高"}
    phonenumber                 {"09012341234"}
    user_id                     {"1"}
    item_id                     {"1"}
    token                       {"1"}
  end
end
