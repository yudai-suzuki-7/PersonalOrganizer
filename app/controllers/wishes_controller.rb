class WishesController < ApplicationController
	def index
		@wish = Wish.new
		@wishes = Wish.where(user_id: current_user)
	end

  def show
    @wish = Wish.find(params[:id])
    @logictree = Logictree.find_or_initialize_by(wish_id:@wish.id)
    if @logictree.persisted?
      render "logictrees/show"
    else
    end

  end

  def edit
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.find(params[:id])
  end

	def create
		wish = Wish.new(wish_params)
    wish.user_id = current_user.id
    if wish.save
      redirect_to action: :index
    else
      redirect_to action: :index
    end
	end

  def edit
    @wish = Wish.find(params[:id])
  end

	def destroy
    wish = Wish.find(params[:id])
    wish.destroy
    redirect_to action: :index
	end

	def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      redirect_to action: :index
    else
      render action: :edit
    end
	end

	private
  def wish_params
    params.require(:wish).permit(:wish_text)
  end

end
