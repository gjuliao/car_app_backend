FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@user.com" }
    password { '123456' }
    password_confirmation { '123456' }

    factory :admin_user do
      name { 'admin' }
      email { 'admin@admin.com' }
    end

    after(:create) do |user|
      puts "Created user #{user.name} with email #{user.email}"
    end

    # Define three users
    factory :belay do
      name { 'Belay Birhanu' }
      email { 'belay@gmail.com' }
    end

    factory :giovanni do
      name { 'Giovanni Juliao' }
      email { 'giovani@gmail.com' }
    end

    factory :diego do
      name { 'Diego Cuenca' }
      email { 'diego@gmail.com' }
    end

    factory :paul do
      name { 'Paul Sáenz' }
      email { 'paul@gmail.com' }
    end
  end
end
