FactoryGirl.define do
  factory :gh do
    uid Faker::Number.number(6)
    provider 'github'
    email 'yhoshino11@gmail.com'
    name 'Yu Hoshino'
    nickname 'yhoshino11'
    image Faker::Company.logo
  end
end
