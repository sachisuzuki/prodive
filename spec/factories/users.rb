FactoryBot.define do
  factory :user, class: User do
    name { 'user01' }
    email { 'user01@mail.com' }
    password { 'password' }
    # provider { '' }
    # uid { '111111' }
  end
  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@mail.com' }
    password { 'password' }
    admin { true }
    # provider { '' }
    # uid { '111111' }
  end
  factory :googleuser, class: User do
    name { 'googleuser' }
    provider { 'google_oauth2' }
    uid { 123456 }
    email { 'user@test.com'}
    password { 'password' }
  end
end
