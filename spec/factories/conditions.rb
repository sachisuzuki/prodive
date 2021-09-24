FactoryBot.define do
  factory :condition, class: Condition do
    divepoint { '前浜' }
    status { 0 }
    association :user
    association :divesite
  end
  factory :new_condition, class: Condition do
    divepoint { '前浜' }
    status { 0 }
    temperature { 10 }
    visibility { 50 }
    content { "海況投稿テスト" }
    association :user
  end
end
