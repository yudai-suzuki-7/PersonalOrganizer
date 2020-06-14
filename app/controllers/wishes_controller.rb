class WishesController < ApplicationController
	def index
		@wish = Wish.new
		@wishes = Wish.all
	end

	def create
		wish = Wish.new(wish_params)
    wish.save
    redirect_to action: :index
	end

  def edit
  end

	def destroy
    wish = Wish.find(params[:id])
    wish.destroy
    redirect_to action: :index
	end

	def update
	end

	 private
    def wish_params
      params.require(:wish).permit(:wish_text)
    end

end
