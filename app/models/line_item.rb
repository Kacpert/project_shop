class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  validates :size, presence: true





  def total_price_pln
		product.price_pln * quantity
	end
	def total_price_eur
		product.price_eur * quantity
	end
end
