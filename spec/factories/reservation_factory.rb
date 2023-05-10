FactoryBot.define do
  factory :reservation do
    sequence(:start_date) { |n| Date.today + n.days }
    sequence(:return_date) { |n| start_date + rand(1.day..5.days) }
    user
    car

    after(:build) do |reservation|
      overlapping_reservations = Reservation.where(
        car: reservation.car,
        start_date: reservation.start_date..reservation.return_date
      )
      if overlapping_reservations.any?
        reservation.start_date = overlapping_reservations.maximum(:return_date) + 1.day
        reservation.return_date = reservation.start_date + rand(1.day..5.days)
      end
    end
  end
end