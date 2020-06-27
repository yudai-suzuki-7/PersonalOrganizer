class LogictreesController < ApplicationController
  def show
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.find_by(wish_id:@wish.id)
  end

  def create
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.new(logictree_params)
    @logictree.wish_id = @wish.id
    if @logictree.save
      redirect_to wishes_path
    else
      render action: :show, noice:"保存失敗・・・"
    end
  end

  def update
    wish = Wish.find(params[:wish_id])
    @logictree = Logictree.where(wish_id: wish.id)
    if @logictree.update(logictree_params)
      redirect_to wishes_path
    else
      render action: :show, noice:"保存失敗・・・"
    end
  end


  private
  def logictree_params
     params.require(:logictree).permit(:wish_id, :logic1, :logic11, :logic12, :logic13, :logic2, :logic21, :logic22, :logic23, :logic3, :logic31, :logic32, :logic33)
  end

end
