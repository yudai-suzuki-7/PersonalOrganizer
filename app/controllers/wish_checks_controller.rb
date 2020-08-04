class WishChecksController < ApplicationController
  def create
    @wish = Wish.find(params[:id])
    @wish_check = WishCheck.new(wish_id: @wish.id)
    @wish_check.save
  end

  def destroy
    @wish = Wish.find(params[:id])
    @wish_check = WishCheck.find_by(wish_id: @wish.id)
    @wish_check.destroy
  end
end
