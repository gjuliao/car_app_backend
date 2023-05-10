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

  describe 'POST /create' do
    it 'Creates a new reservation' do
      reservation_params = {
        start_date: '2023/06/01', return_date: '2023/06/02', user_id: @user.id, car_id: @car1.id,
        city: 'Bogota'
      }
      post api_v1_user_reservations_path(user_id: @user.id), params: { reservation: reservation_params }
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_falsey
      expect(parsed_response['message_code']).to eq('created')
      expect(parsed_response['message']).to eq('Reservation successfully created')
    end

    it 'Give error when not all required parameters are given' do
      reservation_params = {
        start_date: '2023/06/01', return_date: '2023/06/02', user_id: @user.id, car_id: @car1.id
      }
      post api_v1_user_reservations_path(user_id: @user.id), params: { reservation: reservation_params }
      expect(response).to_not be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_truthy
      expect(parsed_response['message_code']).to eq('unable_to_create')
      expect(parsed_response['message']).to eq('Unable to create reservation')
    end
  end

  describe 'PUT /update' do
    it 'Updates information of a reservation' do
      put api_v1_user_reservation_path(user_id: @user.id, id: @reservation2.id),
          params: { reservation: { city: 'Bogota' } }
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_falsey
      expect(parsed_response['message_code']).to eq('updated')
      expect(parsed_response['message']).to eq('Reservation successfully updated')
      @reservation2.reload
      expect(@reservation2.city).to eq('Bogota')
    end
  end

  describe 'DELETE /destroy' do
    it 'Delete a reservation' do
      delete api_v1_user_reservation_path(user_id: @user.id, id: @reservation1.id)
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['message']).to eq('Reservation successfully cancelled')
    end
  end
end
