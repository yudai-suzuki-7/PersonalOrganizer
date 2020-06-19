class WishesController < ApplicationController
	def index
		@wish = Wish.new
		@wishes = Wish.all
	end

  def show
    @wish = Wish.find(params[:id])
    @logictree = Logictree.new
  end

  def edit
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.find(params[:id])
  end

	def create
		wish = Wish.new(wish_params)
    wish.user_id = current_user.id
    wish.save
    redirect_to action: :index
	end

  def edit
    @wish = Wish.find(params[:id])
  end

	def destroy
    wish = Wish.find(params[:id])
    wish.destroy
    redirect_to action: :index, notice:"削除しました"
	end

	def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      redirect_to action: :index, notice:"編集しました"
    else
      render action: :edit
    end
	end

	private
  def wish_params
    params.require(:wish).permit(:wish_text)
  end

end
