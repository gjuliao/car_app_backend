require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'When validating a user' do
    context 'and all required fields are filled with valid values' do
      it 'should create a valid user if they have correct values' do
        user = User.create(name: 'User', email: 'user@user.com', password: '123456',
                           password_confirmation: '123456')

        expect(user).to be_valid
      end
    end

    context 'and all required fields are filled but with some nil values' do
      it 'should not create a valid user if name is nil' do
        user = User.create(name: nil, email: 'user@user.com', password: '123456',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if email is nil' do
        user = User.create(name: 'User', email: nil, password: '123456',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if password is nil' do
        user = User.create(name: 'User', email: 'user@user.com', password: nil,
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if confirmation password is nil' do
        user = User.create(name: 'User', email: 'user@user.com', password: '123456',
                           password_confirmation: nil)

        expect(user).to_not be_valid
      end
    end

    context 'and all required fields are filled but with some empty values' do
      it 'should not create a valid user if name is empty' do
        user = User.create(name: '', email: 'user@user.com', password: '123456',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if email is empty' do
        user = User.create(name: 'User', email: '', password: '123456',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if password is empty' do
        user = User.create(name: 'User', email: 'user@user.com', password: '',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if confirmation password is empty' do
        user = User.create(name: 'User', email: 'user@user.com', password: '123456',
                           password_confirmation: '')

        expect(user).to_not be_valid
      end
    end

    context 'and all required fields are filled but with some invalid values' do
      it 'should not create a valid user if name lenght is greater than 40' do
        name = 'a' * 41
        user = User.create(name:, email: 'user@user.com', password: '123456',
                           password_confirmation: '')

        expect(user).to_not be_valid
      end

      it 'should not create a valid user if password lenght is lesser than 6' do
        password = 'a' * 5
        user = User.create(name: 'User', email: 'user@user.com', password:,
                           password_confirmation: password)

        expect(user).to_not be_valid
      end

      it 'should not create a valid car if passwords do not match' do
        user = User.create(name: 'User', email: 'user@user.com', password: '123456',
                           password_confirmation: '12345678')

        expect(user).to_not be_valid
      end

      it 'should not create a valid car if email is not well formed' do
        user = User.create(name: 'User', email: 'user$user.com', password: '123456',
                           password_confirmation: '123456')

        expect(user).to_not be_valid
      end
    end
  end

  describe 'When associating a user' do
    context 'with reservations' do
      it 'has many reservations dependent on destroy configured' do
        expect(User.reflect_on_association(:reservations).macro).to eq :has_many
        expect(User.reflect_on_association(:reservations).options[:dependent]).to eq :destroy
      end

      it 'has many reservations' do
        car = create(:car)
        user = create(:paul)
        reservation1 = create(:reservation, user:, car:, start_date: Date.today + 1.year,
                                            return_date: Date.tomorrow + 1.year)
        reservation2 = create(:reservation, user:, car:, start_date: Date.today + 21.days,
                                            return_date: Date.tomorrow + 21.day)
        expect(user.reservations).to match_array([reservation1, reservation2])
      end
    end
  end
end
