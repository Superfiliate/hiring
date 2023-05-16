class V1::CartService
  attr_accessor :reference
  attr_reader :line_items, :id

  alias_method :id, :reference

  UNPERMITTED_DISCOUNT_APPLICABLE = %w(KETO)
  CEREAL_DISCOUNT_RULES = {
    1 => 0,
    2 => 5,
    3 => 10,
    4 => 20,
    5 => 25
  }

  class << self
    def create(params)
      cart = new
      cart.reference = params[:reference]
      cart.add_items = params[:lineItems]
      cart.line_items
      cart.apply_cereal_discounts

      CartServiceSerializer.new(cart).to_json
    end
  end

  def add_items=(items)
    @line_items ||= []
    items&.each_with_index do |item, index|
      add_item(item, index)
    end
  end

  def apply_cereal_discounts
    cereals_with_discounts.each do |item|
      item.discount = current_discount
      item.price_with_discount
    end
  end

  def line_item_ids
    line_items.map(&:id)
  end

  def final_price
    return 0.0 if line_items.blank?

    line_items.map(&:final_price).reduce(:+).floor(2)
  end

  private

  def add_item(item, index)
    item[:id] = index + 1
    unless UNPERMITTED_DISCOUNT_APPLICABLE.include? item[:collection].upcase
      item[:with_discount] = true
    end

    item = V1::CartItem.new(item)
    @line_items << item
  end

  def cereals_with_discounts
    line_items.select{|x| x.with_discount }
  end

  def cereal_boxes_with_discount
    cereals_with_discounts.size
  end

  def current_discount
    CEREAL_DISCOUNT_RULES[cereal_boxes_with_discount] || CEREAL_DISCOUNT_RULES[5]
  end
end
