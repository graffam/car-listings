require 'factory_girl'

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "ford#{n}" }
    country "USA"
  end

  factory :car do
    sequence(:name) { |n| "Escalade#{n}" }
    color "Blue"
    year "1920"
    mileage "20000"
    description "This is a lovely car"

    manufacturer
  end
end
