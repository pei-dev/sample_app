module SessionsHelper
    # 渡されたユーザでログインする
    def log_in(user)
        session[:user_id] = user.id
    end
    # 現在ログイン中のユーザを返す（いる場合）
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end

    end

  # 渡されたユーザーがログイン済みユーザーであればtrueを返す
  def current_user?(user)
    user == current_user
  end


    def logged_in? 
        !current_user.nil?
  # ユーザーがログインしていればtrue、その他ならfalseを返す

    end

    def log_out 
        session.delete(:user_id) # セションのユーザIDを削除します。
        @current_user = nil #インスタンス変数のあたいをnilへ。
    end

  # 記憶したURL (もしくはデフォルト値) にリダイレクト
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


    
end
