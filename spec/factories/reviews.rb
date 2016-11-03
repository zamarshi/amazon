FactoryGirl.define do
  factory :review do
    association :user, factory: :user
    association :product, factory: :product
    body "This is a new review"
    star_count {rand(4) + 1}
  end
end
