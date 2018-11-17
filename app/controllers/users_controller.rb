class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # ユーザを新規作成して成功した時の動作
      redirect_to @user
      #下のと上は一緒の意味になる・
      # redirect_to user_url(@user)
    else
      # パーシャル？
      render 'new'
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end




end
