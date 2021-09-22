FactoryBot.define do
  factory :condition, class: Condition do
    divepoint { '前浜' }
    status { 0 }
    association :user
    association :divesite
  end
end
