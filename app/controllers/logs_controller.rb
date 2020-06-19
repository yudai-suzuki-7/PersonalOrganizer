class LogsController < ApplicationController
  def index
    @logs = Log.all
  end

  def new
    @log = Log.new
  end

  def show
    @log = Log.find(params[:id])
  end

  def create
    log = Log.new(log_params)
    log.user_id = current_user.id
    log.save
    redirect_to logs_path
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_path, notice:"削除しました"
  end

  def edit
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to logs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def log_params
    params.require(:log).permit(:user_id, :title, :content, :log_img, :start_time)
  end

end
