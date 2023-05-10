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
    @reservation = Reservation.create!(start_date: '2023/05/09', return_date: '2023/05/12', user: @user, car: @car1,
                                       city: 'Loja')
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

    it 'Retrieve data correctly' do
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_falsey
      expect(parsed_response['message_code']).to eq('found')
      expect(parsed_response['message']).to eq('Car found')
      payload = parsed_response['payload']
      expect(payload['id']).to eq(@car1.id)
      expect(payload['model']).to eq(@car1.model)
      expect(payload['image']).to eq(@car1.image)
      expect(payload['description']).to eq(@car1.description)
      expect(payload['price']).to eq(@car1.price.to_s)
      expect(payload['brand']).to eq(@car1.brand)
      expect(payload['year']).to eq(@car1.year.to_s)
      expect(payload['color']).to eq(@car1.color)
      expect(payload['accidents']).to eq(@car1.accidents)
    end
  end

  describe 'POST /create' do
    it 'Creates a new car' do
      car_params = {
        model: '2018 Jaguar F-Type Coupe',
        image: 'https://simaautoservice.se/wp-content/uploads/2021/07/car-image-transparent-background-8.png',
        description: 'The 2018 Jaguar F-Type Coupe is a luxury sports car that boasts sleek and stylish design.',
        price: 550,
        brand: 'Land Rover',
        year: '2018-01-01',
        color: 'Gray',
        is_electric: false,
        accidents: 0
      }
      post api_v1_cars_path, params: { car: car_params }
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_falsey
      expect(parsed_response['message_code']).to eq('created')
      expect(parsed_response['message']).to eq('Car successfully created')
    end

    it 'Give error when not all required parameters are given' do
      car_params = {
        model: '2018 Jaguar F-Type Coupe',
        image: 'https://simaautoservice.se/wp-content/uploads/2021/07/car-image-transparent-background-8.png',
        description: 'The 2018 Jaguar F-Type Coupe is a luxury sports car that boasts sleek and stylish design.',
        price: 550,
        brand: 'Land Rover',
        year: '2018-01-01',
        color: 'Gray',
        is_electric: false
      }
      post api_v1_cars_path, params: { car: car_params }
      expect(response).to_not be_successful
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['errors']).to be_truthy
      expect(parsed_response['message_code']).to eq('unable_to_create')
      expect(parsed_response['message']).to eq('Unable to create car')
    end
  end

  describe 'PUT /update' do
    it 'Updates information of a car' do
      put api_v1_car_path(id: @car2.id), params: { car: { model: 'Jetta' } }
      expect(response).to be_successful
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['errors']).to be_falsey
        expect(parsed_response['message_code']).to eq('updated')
        expect(parsed_response['message']).to eq('Car successfully updated')
        @car2.reload
        expect(@car2.model).to eq('Jetta')
    end
  end

  describe 'DELETE /destroy' do
    it 'Delete a car' do
      delete api_v1_car_path(id: @car1.id)
      expect(response).to be_successful
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['message']).to eq('Car successfully deleted')
    end
  end
end
