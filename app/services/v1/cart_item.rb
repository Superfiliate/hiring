class V1::CartItem
  attr_accessor :with_discount, :discount
  attr_reader :id, :name, :price, :collection, :final_price

  def initialize(params)
    @name = params[:name]
    @price = params[:price].to_f
    @collection = params[:collection]
    @with_discount = params[:with_discount] || false
    @discount = 0
    @final_price = price
    @id = params[:id]
  end

  def price_with_discount
    @final_price = (price - (price * discount).fdiv(100))
  end
end
