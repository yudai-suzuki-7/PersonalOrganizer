class LogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @logs = Log.where(user_id: current_user)
  end

  def new
    @logs = Log.where(user_id: current_user)
    @log = Log.new
  end

  def show
    @logs = Log.where(user_id: current_user)
    @log = Log.find(params[:id])
  end

  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
    if @log.save
      redirect_to log_path(@log)
    else
      @logs = Log.all
      render action: :new
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_path
  end

  def edit
    @logs = Log.all
    @log = Log.find(params[:id])
  end

  def update
    @log = Log.find(params[:id])
    if @log.update(log_params)
      redirect_to log_path(@log)
    else
      @logs = Log.all
      render action: :edit
    end
  end

  private

  def log_params
    params.require(:log).permit(:user_id, :title, :content, :log_img, :start_time)
  end

end
