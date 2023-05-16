class CartsController < ApplicationController
  def create
    render json: ::V1::CartService.create(create_params)
  end

  private

  def create_params
    params.require(:cart).permit(:reference, lineItems: [:name, :price, :collection])
  end
end
