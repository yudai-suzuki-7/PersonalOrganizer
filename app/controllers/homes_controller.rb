class HomesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to controller: :logs, action: :index
    else
    end
  end

  def about
  end
end
