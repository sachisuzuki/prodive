# frozen_string_literal: true

FactoryBot.define do
  factory :relationship do
    follower_id    { FactoryBot.create(:user).id }
    followed_id    { FactoryBot.create(:user02).id }
  end
end
