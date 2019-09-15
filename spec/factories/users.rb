FactoryBot.define do
  factory :user do
    first_name  { "User" }
    last_name   { "Sample" }
    gender      { :male }
    birthday    { "2000-01-01" }
  end
end
