class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
                        # emailというキーでパラメータの中のセッションの中のemailを小文字にした値をハッシュ値とする
    if user && user.authenticate(params[:session][:password])
      # ユーザログイン後にユーザー情報のページにリダイレクトする
      log_in user  # session_helperで定義したメソッドのことです。
      redirect_to user # ?????
    else
      # エラーメッセージを作成する
      flash.now[:danger] = 'Invalid email/password comnbination' 
      # flashはどこのメソッド？
      render 'new'
    end
  end
  def destroy
  end
end
