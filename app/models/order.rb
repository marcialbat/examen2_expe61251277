class Order < ApplicationRecord
	   validates :Quantity	, presence: true, numericality: {greater_than: 0}
    belongs_to :book

    before_create :set_dates

    validate :no_esta_rentado

    def no_esta_rentado
    if Book.find_by(id: book_id).orders.any?
      @order = Book.find_by(id: book_id).orders.order("created_at").last
      if  @order.order_end_at > Date.today
        errors.add(:order_start_at, "Este carro esta prestado.")
      end
    end
  end

    protected

    def set_dates
      self.order_end_at = Date.today 
    end

end
