require 'factory_girl'

FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "ford#{n}" }
    country "USA"
  end
end
