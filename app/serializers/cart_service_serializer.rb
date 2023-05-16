class CartServiceSerializer
  include JSONAPI::Serializer

  has_many :line_items, serializer: 'CartItemService'

  attributes :reference, :line_items, :final_price
end
