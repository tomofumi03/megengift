class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:show, :edit, :update]

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

  def logged_in_user
    unless logged_in?
      store_location
      flash[:notice] = "恐れ入りますが、ログインしてからもう一度やり直してください。"
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless @user == current_user
  end

end
