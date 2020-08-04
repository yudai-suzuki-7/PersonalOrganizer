class WishesController < ApplicationController
  before_action :authenticate_user!

	def index
		@wish = Wish.new
		@wishes = Wish.where(user_id: current_user)
	end

  def show
    @wish = Wish.find(params[:id])
    @logictree = Logictree.find_or_initialize_by(wish_id:@wish.id)
    if @logictree.persisted?
      render "logictrees/show"
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

  def check
    wish = Wish.find(params[:id])
    if wish.wish_status == "undone"
      wish.wish_status = "done"
    else
      wish.wish_status = "undone"
    end
    wish.update(wish_status: wish.wish_status)
    @wishes = Wish.where(user_id: current_user)
    @wish = Wish.new
    render 'check.js.erb'
  end

	private
  def wish_params
    params.require(:wish).permit(:wish_text, :wish_status)
  end

end
