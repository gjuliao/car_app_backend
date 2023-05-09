require 'rails_helper'

RSpec.describe 'Api::V1::Cars', type: :request do
  include Warden::Test::Helpers

  before do
    @user = User.create!(name: 'Belay Birhanu', email: 'belay@gmail.com', password: '123456',
      password_confirmation: '123456')
    login_as(@user, scope: :user)
    @car1 = Car.create!(
      model: '2018 Jaguar F-Type Coupe',
      image: 'https://simaautoservice.se/wp-content/uploads/2021/07/car-image-transparent-background-8.png',
      description: 'The 2018 Jaguar F-Type Coupe is a luxury sports car',
      price: 550,
      brand: 'Land Rover',
      year: '2018-01-01',
      color: 'Gray',
      is_electric: false,
      accidents: 0
    )
    @car2 = Car.create!(
      model: '2020 Jaguar F-Type Coupe',
      image: 'https://simaautoservice.se/wp-content/uploads/2021/07/car-image-transparent-background-8.png',
      description: 'The 2018 Jaguar F-Type Coupe is a luxury sports car',
      price: 550,
      brand: 'Land Rover',
      year: '2020-01-01',
      color: 'Red',
      is_electric: true,
      accidents: 2
    )
    @reservation = Reservation.create!(start_date: '2023/05/09', return_date: '2023/05/12', user: @user, car: @car1, city: 'Loja')
  end

  describe 'GET /index' do
    before do
      get api_v1_cars_path
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns all cars' do
      expect(assigns(:cars)).to match_array([@car1, @car2])
    end
  end

  describe 'GET /show' do
    before do
      get api_v1_car_path(id: @car1.id)
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

  end
end
