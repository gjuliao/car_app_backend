class Car < ApplicationRecord
  def as_json(options = {})
    super(options.merge(
      only: %i[id model image price brand year color accidents]
    )).merge({ rented: rented?, electric: is_electric })
  end

  private

  def rented?
    # TODO: Implement this method
    # Car.reservations.where(car_id: id).where("start_date <= ? AND end_date >= ?", Date.today, Date.today).any?
    true
  end
end
