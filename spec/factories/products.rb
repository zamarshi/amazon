FactoryGirl.define do
  factory :product do
    association :category, factory: :category
    association :user, factory: :user
    sequence(:title) {|n| "What is up World #{n}"}
    description {Faker::Hipster.paragraph}
    price {rand(100) + 1}
  end
end
