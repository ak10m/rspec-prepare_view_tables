FactoryBot.define do
  factory :score do
    association :user, strategy: :build
    scored_on { Date.today }
    point { Random.rand(0..100) }
  end
end
