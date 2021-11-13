class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:notice] = "#{@user.name}さん! ようこそ"
      redirect_to user_path(@user)
    else
      #binding.pry
      redirect_to new_user_path
      flash[:notice] = "登録できませんでした。恐れ入りますが、もう一度やり直してください。"
    end
  end

  def show
    @user = User.find(params[:id])
    @phrase = Phrase.where( 'id >= ?', rand(Phrase.first.id..Phrase.last.id) ).first
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
