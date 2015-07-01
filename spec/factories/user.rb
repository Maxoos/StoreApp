FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    password "123456"
    user_name {Faker::Internet.user_name}
    # skip model shop create callback so FactoryGirl could be used as shop
    shop
    after(:build) { |user| user.class.skip_callback(:create, :before, :build_default_shop) }
  end
end
