class Order < ApplicationRecord
	   validates :Quantity	, presence: true, numericality: {greater_than: 0}
    belongs_to :book

    before_create :set_dates

    validate :no_esta_rentado

    def no_esta_rentado
    if Car.find_by(id: car_id).rents.any?
      @rent = Car.find_by(id: car_id).rents.order("created_at").last
      if  @rent.rent_end_at > Date.today
        errors.add(:rent_start_at, "Este carro esta prestado.")
      end
    end
  end

    protected

    def set_dates
      self.rent_end_at = Date.today + days.days
      self.rent_start_at = Date.today
    end

end
