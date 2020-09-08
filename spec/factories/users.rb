FactoryBot.define do
  factory :user do
    nickname                  {"フクイ太郎"}
    email                     {"kkk@gmail.com"}
    password                  {"00000a"}
    password_confirmation     {password}
    family_name               {"山田"}
    last_name                 {"隆太郎"}
    family_name_kana          {"ヤマダ"}
    last_name_kana            {"リクタロウ"}
    birthday                  {"1930-01-01"}
    end
end