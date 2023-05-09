class Reservation < ApplicationRecord
  validate :return_date_greater_than_start_date
  belongs_to :user
  belongs_to :car
  validates :city, presence: true, length: { maximum: 50 }
  validates :start_date, presence: true
  validates :return_date, presence: true

  def as_json(options = {})
    super(options.merge(
      only: %i[city start_date return_date]
    ))
  end

  private

  def return_date_greater_than_start_date
    return unless return_date <= start_date

    errors.add(:return_date, 'must be greater than start date')
  end
end
