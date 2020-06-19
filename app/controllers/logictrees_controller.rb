class LogictreesController < ApplicationController
  def show
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.find(params[:wish_id])
  end

  def create
    @wish = Wish.find(params[:wish_id])
    @logictree = Logictree.new(logictree_params)
     logictree.user_id = current_user.id
    if @logictree.save
      redirect_to wish_logictrees_path(params[:wish_id])
    else
      render action: :index, noice:"保存失敗・・・"
    end
  end

  def index
  end

  def update
    @logictree = Logictree.find(params[:id])
    if @logictree.update(logictree_params)
      render action: :show, noice:"更新しました"
    else
      render action: :show, noice:"更新失敗・・・"
    end
  end


  private
  def logictree_params
     params.require(:logictree).permit(:wish_id, :logic1, :logic11, :logic12, :logic2, :logic21, :logic22, :logic3, :logic31, :logic32)
  end

end
