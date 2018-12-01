class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    
  end
  
  def new
    @user = User.new
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user # ユーザ登録とあわせてログインさせる
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

  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if @user.update_attributes(user_params) #更新がうまくできればtrue
      # 更新成功の場合
      flash[:success] = "Profile updated"
      redirect_to @user
    elsif
      render 'edit'
      #フラッシュメッセージを表示させるはず
    end 
  end

  private 
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    # beforeアクション

    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

end
