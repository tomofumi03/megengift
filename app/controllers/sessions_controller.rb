class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:notice] = "ログインしました。"
      log_in user
      redirect_to user
    else
      flash[:notice] = "恐れ入りますが、もう一度やり直してください。"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
