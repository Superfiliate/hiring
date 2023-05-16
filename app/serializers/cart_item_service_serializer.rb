class CartItemServiceSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :price, :collection, :with_discount, :discount, :final_price
end
