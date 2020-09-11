FactoryBot.define do
  factory :item do
    name                 {'test'}
    comment              {'test'}
    price                { '300' }
    category_id          { '2' }
    status_id            { '2' }
    deliveryfee_id       { '2' }
    areaofdelivery_id    { '2' }
    daysunilshipping_id  { '2' }
    association :user
  end
end
