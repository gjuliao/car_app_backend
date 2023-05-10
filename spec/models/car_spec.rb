require 'rails_helper'

RSpec.describe Car, type: :model do
  describe 'When validating a car' do
    context 'and all required fields are filled with valid values' do
      it 'should create a valid car if they have correct values' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', price: 1000, accidents: 0)

        expect(car).to be_valid
      end
    end

    context 'and all required fields are filled but with some nil values' do
      it 'should not create a valid car if model is nil' do
        car = Car.create(model: nil, image: 'http://someurl.png', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if image is nil' do
        car = Car.create(model: '2020 Some model', image: nil, price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if price is nil' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', price: nil, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if accidents is nil' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', price: 250, accidents: nil)

        expect(car).to_not be_valid
      end
    end

    context 'and all required fields are filled but with some empty values' do
      it 'should not create a valid car if model is empty' do
        car = Car.create(model: '', image: 'http://someurl.png', description: 'Some car', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if image is empty' do
        car = Car.create(model: '2020 Some model', image: '', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end
    end

    context 'and all required fields are filled but with some invalid values' do
      it 'should not create a valid car if model lenght is greater than 250' do
        model = 'a' * 251
        car = Car.create(model:, image: 'http://someurl.png', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if price is less than zero' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', price: -250, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if accidents is less than zero' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', price: 250, accidents: -5)

        expect(car).to_not be_valid
      end
    end

    context 'and some required fields are not filled' do
      it 'should not create a valid car if model is not filled' do
        car = Car.create(image: 'http://someurl.png', description: 'Some car', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if image is not filled' do
        car = Car.create(model: '2020 Some model', description: 'Some car', price: 1000, accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if price is not filled' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', description: 'Some car', accidents: 0)

        expect(car).to_not be_valid
      end

      it 'should not create a valid car if accidents is not filled' do
        car = Car.create(model: '2020 Some model', image: 'http://someurl.png', description: 'Some car', price: 1000)

        expect(car).to_not be_valid
      end
    end
  end

  describe 'When associating a car' do
    context 'with reservations' do
      it 'has many reservations dependent on destroy configured' do
        expect(Car.reflect_on_association(:reservations).macro).to eq :has_many
        expect(Car.reflect_on_association(:reservations).options[:dependent]).to eq :destroy
      end

      it 'has many reservations' do
        car_with_res = car_with_reservations(counter: 5)
        expect(car_with_res.reservations.count).to eq 5
      end

      it 'has many reservations' do
        car = create(:car)
        user = create(:paul)
        reservation1 = create(:reservation, user:, car:, start_date: Date.today, return_date: Date.tomorrow)
        reservation2 = create(:reservation, user:, car:, start_date: Date.today + 1.day,
                                            return_date: Date.tomorrow + 1.day)
        expect(car.reservations).to match_array([reservation1, reservation2])
      end
    end
  end
end
