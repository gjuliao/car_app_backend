require 'faker'

FactoryBot.define do
  factory :car do
    model { "#{Faker::Vehicle.year} #{Faker::Vehicle.make_and_model} #{Faker::Vehicle.version}" }
    image { 'http://someurl.com' }
    price { Faker::Number.decimal(l_digits: 4, r_digits: 2) }
    accidents { Faker::Number.between(from: 1, to: 10) }

    after(:create) do |car|
      puts "Created car #{car.model} with price #{car.price}"
    end
  end
end

def car_with_reservations(counter: 5)
  user = FactoryBot.create(:user)
  FactoryBot.create(:car) do |car|
    FactoryBot.create_list(:reservation, counter, user:, car:)
  end
end
