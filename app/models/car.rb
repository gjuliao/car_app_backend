class Car < ApplicationRecord
  validates :model, presence: true, length: { maximum: 250 }
  validates :image, presence: true
  validates :price, comparison: { greater_than_or_equal_to: 0 }
  validates :accidents, comparison: { greater_than_or_equal_to: 0 }

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
