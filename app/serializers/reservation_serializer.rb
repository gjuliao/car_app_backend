class ReservationSerializer < ActiveModel::Serializer
  belongs_to :car
  attributes :id, :start_date, :end_date
end
