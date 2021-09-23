FactoryBot.define do
  factory :user, class: User do
    name { 'user01' }
    email { 'user01@mail.com' }
    password { 'password' }
    provider { '' }
    uid { 111111 }
  end
  factory :user02, class: User do
    name { 'user02' }
    email { 'user02@mail.com' }
    password { 'password' }
    provider { '' }
    uid { 222222 }
  end
  factory :admin_user, class: User do
    name { 'admin' }
    email { 'admin@mail.com' }
    password { 'password' }
    admin { true }
  end
  factory :googleuser, class: User do
    name { 'googleuser' }
    provider { 'google_oauth2' }
    uid { 123456 }
    email { 'user@test.com'}
    password { 'password' }
  end
end
