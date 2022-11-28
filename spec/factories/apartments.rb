FactoryBot.define do
  factory :apartment do
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    address { "MyString" }
    city { "MyString" }
    postal_code { "MyString" }
    surface { 1 }
    furnished { false }
    garden { false }
    basement { false }
    custodian { false }
  end
end
