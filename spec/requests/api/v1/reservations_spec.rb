require 'rails_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
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
    @reservation1 = Reservation.create!(start_date: '2023/05/09', return_date: '2023/05/12', user: @user, car: @car1,
                                       city: 'Loja')
    @reservation2 = Reservation.create!(start_date: '2023/05/09', return_date: '2023/05/12', user: @user, car: @car2,
                                        city: 'Lima')
  end

  describe 'GET /index' do
    before do
      get api_v1_user_reservations_path(user_id: @user.id)
    end

    it 'should returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns all reservations for that user' do
      expect(assigns(:reservations)).to match_array([@reservation1, @reservation2])
    end
  end

  describe 'GET /show' do
    before do
      get api_v1_user_reservation_path(user_id: @user.id, id: @reservation1.id)
    end

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'Retrieve data correctly' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_falsey
      expect(parsed_response['message_code']).to eq('found')
      expect(parsed_response['message']).to eq('Reservation found')
      payload = parsed_response['payload']
      expect(payload['start_date']).to eq(@reservation1.start_date.to_s)
      expect(payload['return_date']).to eq(@reservation1.return_date.to_s)
      expect(payload['city']).to eq(@reservation1.city)
    end
  end

end
