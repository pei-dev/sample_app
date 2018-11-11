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
      #成功の場合
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
