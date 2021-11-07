class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
    else
      flash[:success] = "登録に失敗しました"
      render 'new'
    end
  end

  def destroy
  end
end
