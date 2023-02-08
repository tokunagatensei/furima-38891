FactoryBot.define do

  factory :user do
    nickname              {"フリマ太郎"}
    email                 {Faker::Internet.free_email}
    password              {"test123"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"1999-04-08"}
  end

end
