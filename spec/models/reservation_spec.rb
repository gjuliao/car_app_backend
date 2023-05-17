require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'User', email: 'user@user.com', password: '123456', password_confirmation: '123456') }
  let(:car) { Car.create(model: '2020 Some model', image: 'http://someurl.png', description: 'Some car', price: 250, accidents: 0) }

  describe 'When validating a reservation' do
    context 'and all required fields are filled with valid values' do
      it 'should create a valid reservation if return_date is greater than start_date' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:, car:,
          city: 'Lima')

        expect(reservation).to be_valid
      end

      it 'should create a valid reservation if return_date is equal to start_date' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:, car:,
          city: 'Lima')

        expect(reservation).to be_valid
      end
    end

    context 'and all required fields are filled but with some nil values' do
      it 'should not create a valid reservation if user is nil' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user: nil, car:,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end

      it 'should not create a valid reservation if car is nil' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:, car: nil,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end
    end

    context 'and all required fields are filled but with some invalid values' do
      it 'should not create a valid reservation if return_date is less than start_date' do
        reservation = Reservation.create(start_date: Date.today + 1.day, return_date: Date.today, user:, car:,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end

      it 'should not create a valid reservation if car is already rented in the period' do
        Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:, car:,
          city: 'Lima')
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:, car:,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end
    end

    context 'and some required fields are not filled' do
      it 'should not create a valid reservation if user is not filled' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, car:,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end

      it 'should not create a valid reservation if car is not filled' do
        reservation = Reservation.create(start_date: Date.today, return_date: Date.today + 1.day, user:,
          city: 'Lima')

        expect(reservation).to_not be_valid
      end
    end
  end

  describe 'When associating a reservation' do
    context 'with car' do
      it 'should belong to one car configured' do
        reservation = Reservation.reflect_on_association(:car)
        expect(reservation.macro).to eq(:belongs_to)
      end

      it 'should belong to one user configured' do
        reservation = Reservation.reflect_on_association(:user)
        expect(reservation.macro).to eq(:belongs_to)
      end

      it 'belongs to a user' do
        user = create(:paul)
        reservation = create(:reservation, user:)
        expect(reservation.user).to eq(user)
      end

      it 'belongs to a car' do
        car = create(:car)
        reservation = create(:reservation, car:)
        expect(reservation.car).to eq(car)
      end
    end
  end
end
