class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :model, presence: true, length: { maximum: 250 }
  validates :image, presence: true
  validates :price, comparison: { greater_than_or_equal_to: 0 }
  validates :accidents, comparison: { greater_than_or_equal_to: 0 }

  def as_json(options = {})
    super(options.merge(
      only: %i[id model image description price brand year color accidents is_electric]
    ))
  end
end
